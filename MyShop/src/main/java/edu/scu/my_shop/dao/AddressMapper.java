package edu.scu.my_shop.dao;

import edu.scu.my_shop.entity.Address;
import edu.scu.my_shop.entity.AddressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    long countByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int deleteByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int deleteByPrimaryKey(String addressId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int insert(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int insertSelective(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    List<Address> selectByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    Address selectByPrimaryKey(String addressId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int updateByExample(@Param("record") Address record, @Param("example") AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int updateByPrimaryKeySelective(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbg.generated Tue Mar 20 09:22:55 CST 2018
     */
    int updateByPrimaryKey(Address record);
}