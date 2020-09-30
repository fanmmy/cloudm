package com.cloudm.auth.config;

import com.cloudm.auth.authentication.CloudmUsernamePasswordAuthenticationProvider;
import com.cloudm.auth.authorization.CloudmAccessDecisionManager;
import com.cloudm.auth.authorization.CloudmAccessSecurityMetadataSource;
import com.cloudm.auth.service.CloudmUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.OrRequestMatcher;

/**
 * @param
 * @author fanmingyong
 */
//@Configuration
//@EnableWebSecurity
//@EnableConfigurationProperties(SecurityProperties.class)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private SecurityProperties securityProperties;

    @Autowired
    private CloudmUsernamePasswordAuthenticationProvider cloudmUsernamePasswordAuthenticationProvider;
    @Autowired
    private CloudmAccessSecurityMetadataSource cloudmAccessSecurityMetadataSource;
    @Autowired
    private CloudmAccessDecisionManager cloudmAccessDecisionManager;
    @Autowired
    private PersistentTokenRepository persistentTokenRepository;

    /**
     * 用户认证配置
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        /**
         * 指定用户认证时，默认从哪里获取认证用户信息
         */
        auth.authenticationProvider(cloudmUsernamePasswordAuthenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
//                .authorizeRequests()
//                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
//                    @Override
//                    public <O extends FilterSecurityInterceptor> O postProcess(O object) {
//                        object.setSecurityMetadataSource(cloudmAccessSecurityMetadataSource);
//                        object.setAccessDecisionManager(cloudmAccessDecisionManager);
//                        return object;
//                    }
//                }).and().
//                exceptionHandling()
//                .accessDeniedHandler(cloudmAccessDeniedHandler)
//                .and()
                .csrf()
                .disable()
                .formLogin()
                .loginPage(securityProperties.getLoginPage())
                .loginProcessingUrl(securityProperties.getLoginUrl())
                .permitAll()
                .and()
                .logout()
                .logoutUrl(securityProperties.getLogoutUrl())
                .logoutSuccessUrl(securityProperties.getLoginPage())
                .logoutRequestMatcher(getLogoutRequestMatchers())
                .permitAll()
                .and()
                .rememberMe()
                .tokenRepository(persistentTokenRepository)
                .tokenValiditySeconds(securityProperties.getRememberMeSeconds())
                .and()
                .authorizeRequests()
                .antMatchers(securityProperties.getPermitedUrl())
                .permitAll()
                .anyRequest()
                .authenticated();


    }


    @Bean
    @Override
    public UserDetailsService userDetailsService() {

        return new CloudmUserDetailsService();
    }

    /**
     * 密码加密器
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        /**
         * BCryptPasswordEncoder：相同的密码明文每次生成的密文都不同，安全性更高
         */
        PasswordEncoder passwordEncoder = new PasswordEncoder() {

            @Override
            public String encode(CharSequence charSequence) {
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
                return charSequence.equals(s);
            }
        };
        return passwordEncoder;
    }


    /**
     * 指定保存用户登录“记住我”功能的Token的方法：
     * 默认是使用InMemoryTokenRepositoryImpl将Token放在内存中，
     * 如果使用JdbcTokenRepositoryImpl，会创建persistent_logins数据库表，并将Token保存到该表中。
     */
    @Bean
    public PersistentTokenRepository getPersistentTokenRepository() {
        InMemoryTokenRepositoryImpl inMemoryTokenRepository = new InMemoryTokenRepositoryImpl();
        return inMemoryTokenRepository;
    }

    /**
     * 自定义退出登录的RequestMatcher
     */
    private OrRequestMatcher getLogoutRequestMatchers() {
        /**
         * 用户退出登录时，匹配GET请求/logout和POST请求/logout，使得这两种请求都执行退出登录操作
         * 默认情况（未禁用跨域请求伪造，且自定义用户登录页面）下，只对POST请求/logout才执行退出登录操作
         */
        AntPathRequestMatcher getLogoutRequestMatcher = new AntPathRequestMatcher(securityProperties.getLogoutUrl(), "GET");
        AntPathRequestMatcher postLogoutRequestMatcher = new AntPathRequestMatcher(securityProperties.getLogoutUrl(), "POST");
        return new OrRequestMatcher(getLogoutRequestMatcher, postLogoutRequestMatcher);
    }


}
