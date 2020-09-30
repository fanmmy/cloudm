package com.cloudm.auth.entity;

/**
 * @author fanmingyong
 */

import com.cloudm.auth.service.CloudmUserDetailsService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

/**
 * @author shuang.kou
 * 获取当前请求的用户
 */
@Component
public class CurrentUser {

    private final CloudmUserDetailsService userDetailsService;

    public CurrentUser(CloudmUserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    public User getCurrentUser() {
        return (User) userDetailsService.loadUserByUsername(getCurrentUserName());
    }

    /**
     * TODO:由于在JWTAuthorizationFilter这个类注入UserDetailsServiceImpl一致失败，
     * 导致无法正确查找到用户，所以存入Authentication的Principal为从 token 中取出的当前用户的姓名
     */
    private static String getCurrentUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null) {
            return (String) authentication.getPrincipal();
        }
        return null;
    }
}