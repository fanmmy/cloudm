package com.cloudm.pub.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloudm.pub.entity.CloudRole;
import com.cloudm.pub.entity.CloudUserRole;
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

public interface CloudUserRoleMapper extends BaseMapper<CloudUserRole> {

    @Select("   select a.* from cloud_role a join cloud_user_role b on a.id = b.role_id\n" +
            "        where b.user_id = #{user_id} and a.enabled = 1")
    List<CloudRole> queryUserRoles(@Param("user_id") long user_id);
}
