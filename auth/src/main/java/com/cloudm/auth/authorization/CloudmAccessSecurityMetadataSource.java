package com.cloudm.auth.authorization;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author fanmingyong
 */
@Slf4j
@Component
public class CloudmAccessSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    private Map<RequestMatcher, Collection<ConfigAttribute>> permissionMap;

    /**
     * 在Web服务器启动时，缓存系统中的所有权限映射。<br>
     * 被{@link PostConstruct}修饰的方法会在服务器加载Servlet的时候运行(构造器之后,init()之前) <br/>
     */
    @PostConstruct
    private void loadResourceDefine() {
        permissionMap = new LinkedHashMap<>();

        // 需要鉴权的url资源，@needAuth标志
        List<Permission> permissionList = new ArrayList<>();
        Permission a1 = new Permission("/test", "*",new String[]{"ROLE_USE1R"});
        permissionList.add(a1);
        for (Permission p : permissionList) {

            AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher(p.url, "*".equals(p.method) ? null : p.method);

            Collection<ConfigAttribute> attributes = new ArrayList<>();
            for (String role : p.roles) {
                attributes.add(new SecurityConfig(role));
            }
            // 占位符，需要权限才能访问的资源 都需要添加一个占位符，保证value不是空的
            attributes.add(new SecurityConfig("@needAuth"));
            permissionMap.put(requestMatcher, attributes);
        }

        // 公共的url资源 & 系统接口的url资源，value为null
        List<Permission> publicList = new ArrayList<>();
        Permission p1 = new Permission("/loginPage", "*");
        Permission p2 = new Permission("/login", "*");
        publicList.add(p1);
        publicList.add(p2);
        for (Permission p : publicList) {

            AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher(p.url, "*".equals(p.method) ? null : p.method);
            // value为空时不做鉴权，相当于所有人都可以访问该资源URL
            permissionMap.put(requestMatcher, null);
        }

        // 多余的url资源， @noAuth，所有人都无法访问
        Collection<ConfigAttribute> attributes = new ArrayList<>();
        attributes.add(new SecurityConfig("@noAuth"));
        permissionMap.put(new AntPathRequestMatcher("/**", null), attributes);

        log.info("[全局权限映射集合初始化]: {}", permissionMap.toString());
    }

    /**
     * 根据URL找对应的权限
     *
     * @param object
     * @return
     * @throws IllegalArgumentException
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        log.info("[资源被访问：根据URL找到权限配置]: {}\n {}", object, permissionMap);

        if (permissionMap == null) {
            loadResourceDefine();
        }
        final HttpServletRequest request = ((FilterInvocation) object).getRequest();
        for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : permissionMap.entrySet()) {
            if (entry.getKey().matches(request)) {
                log.info("[找到的Key]: {}", entry.getKey());
                log.info("[找到的Value]: {}", entry.getValue());
//                if (entry.getValue().size() > 0) {
                    return entry.getValue();
//                }
            }
        }
        //匹配不成功返回一个特殊的ROLE_NONE
        return SecurityConfig.createList("ROLE_NONE");

    }

    /**
     * 返回所有的ConfigAttribute，以筛选出不符合要求的ConfigAttribute
     *
     * @return
     */
    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return new ArrayList<>();
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }

    class Permission {
        public String url;
        public String method;
        public String[] roles = new String[]{};

        public Permission(String url, String method) {
            this.url = url;
            this.method = method;
        }

        public Permission(String url, String method, String[] roles) {
            this.url = url;
            this.method = method;
            this.roles = roles;
        }
    }
}
