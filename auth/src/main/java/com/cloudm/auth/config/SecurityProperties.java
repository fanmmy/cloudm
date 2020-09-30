package com.cloudm.auth.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author fanmingyong
 */
@Data
@ConfigurationProperties("cloudm.security")
public class SecurityProperties {
    public String loginPage = "/loginPage";
    private String loginUrl = "/login";
    private String loginSuccessUrl = "/";
    private String loginFailUrl = "/error";
    private String logoutUrl = "/logout";
    private int rememberMeSeconds = 3600;
    private String[] permitedUrl = {"/login/**","/loginPage/**"};

    private boolean alwaysUseDefaultLoginSuccessfulRequestUrl = true;
}
