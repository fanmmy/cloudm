package com.cloudm.pub.mapper;

import com.cloudm.pub.entity.CloudModule;
import com.cloudm.pub.entity.CloudUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author fanmingyong
 * @since 2020-03-25
 */
public interface CloudUserMapper extends BaseMapper<CloudUser> {
    /**
     * 查询用户的模块
     * @param user_id
     * @return
     */
    @Select("SELECT m.* FROM  cloud_user_role a join cloud_permission_module b on a.role_id = b.resource_id and b.user_mode = 0 join cloud_module m on m.id = b.module_id\n" +
            "where a.user_id = #{user_id} \n" +
            "UNION all \n" +
            "SELECT m.* FROM    cloud_permission_module b join cloud_module m on m.id = b.module_id and b.user_mode = 1 \n" +
            "where b.resource_id = #{user_id} ")
    List<CloudModule> queryUserModule(@Param("user_id") Long user_id);
}
