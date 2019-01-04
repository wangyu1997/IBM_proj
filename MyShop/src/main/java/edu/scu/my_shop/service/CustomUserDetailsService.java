package edu.scu.my_shop.service;

import edu.scu.my_shop.dao.UserMapper;
import edu.scu.my_shop.entity.SecurityUser;
import edu.scu.my_shop.entity.User;
import edu.scu.my_shop.entity.UserExample;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    final
    SqlSessionFactory sqlSessionFactory;

    @Autowired
    public CustomUserDetailsService(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        List<User> users;

        //获得SqlSession
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //根据用户名查找用户
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserIdEqualTo(username);
        userExample.or().andUserNameEqualTo(username);

        users = userMapper.selectByExample(userExample);

        //没找到用户
        if (null == users || users.isEmpty()) {

            throw new UsernameNotFoundException("用户名"+username+"不存在");
        }
        // SecurityUser实现UserDetails并将user_id映射为username
        SecurityUser securityUser = new SecurityUser(users.get(0));
        System.out.println(Collections.singletonList(securityUser.getAuthorities()));
        //关闭
        sqlSession.close();
        return securityUser;
    }
}
