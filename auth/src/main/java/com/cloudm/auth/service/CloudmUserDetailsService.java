package com.cloudm.auth.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cloudm.auth.entity.JwtUser;
import com.cloudm.pub.entity.CloudRole;
import com.cloudm.pub.entity.CloudUser;
import com.cloudm.pub.mapper.CloudUserRoleMapper;
import com.cloudm.pub.service.ICloudUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


/**
 * @author fanmingyong
 */
@Service
public class CloudmUserDetailsService implements UserDetailsService {
    @Autowired
    private ICloudUserService cloudUserService;
    @Autowired
    private CloudUserRoleMapper cloudUserRoleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        LambdaQueryWrapper<CloudUser> queryWrapper = new QueryWrapper<CloudUser>().lambda().eq(CloudUser::getLoginName, username);
        CloudUser user = cloudUserService.getBaseMapper().selectOne(queryWrapper);
        if (user == null) {
            throw new UsernameNotFoundException("用户不存在");
        }

        //添加角色列表
        List<CloudRole> roles = cloudUserRoleMapper.queryUserRoles(user.getId());
        final Set<SimpleGrantedAuthority> authList = roles.stream().map(r -> {
            String temp = r.getCode();
            String roleStr = ("ROLE_" + temp).toUpperCase();
            return new SimpleGrantedAuthority(roleStr);
        }).collect(Collectors.toSet());


        UserDetails userDetail = JwtUser.builder().username(username).password(user.getPassword())
                .authorities(authList).accountExpired(false)
                .credentialsExpired(false).disabled(!user.getEnabled()).cloudUser(user)
                .accountLocked(false).build();
        return userDetail;
    }
}
