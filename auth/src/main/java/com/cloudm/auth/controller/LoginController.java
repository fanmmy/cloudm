package com.cloudm.auth.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.QueryChainWrapper;
import com.cloudm.auth.entity.JwtUser;
import com.cloudm.auth.service.CloudmUserDetailsService;
import com.cloudm.pub.entity.CloudModule;
import com.cloudm.pub.entity.CloudRole;
import com.cloudm.pub.entity.CloudUser;
import com.cloudm.pub.mapper.CloudModuleMapper;
import com.cloudm.pub.mapper.CloudUserMapper;
import com.cloudm.pub.mapper.CloudUserRoleMapper;
import com.cloudm.pub.vo.ResponseResult;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static com.cloudm.pub.utils.LambdaUtil.distinctByKey;

/**
 * @author fanmingyong
 */
@Controller
public class LoginController {
    @Autowired
    private CloudmUserDetailsService cloudmUserDetailsService;
    @Autowired
    private CloudUserMapper cloudUserMapper;
    @Autowired
    private CloudUserRoleMapper cloudUserRoleMapper;


    @GetMapping("/loginPage")
    public String loginPage() {
        CloudUser cloudUser = cloudUserMapper.selectById(1);
        System.out.println(cloudUser);
        return "loginPage";
    }

    @PostMapping("/auth/logout")
    @ResponseBody
    private ResponseResult logout() {

        return ResponseResult.ok("");
    }

    @RequestMapping("/user/info")
    @ResponseBody
    private ResponseResult userInfo() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
         
        String username = (String) authentication.getPrincipal();

        CloudUser user = cloudUserMapper.selectOne(new QueryWrapper<CloudUser>().lambda().eq(CloudUser::getLoginName, username));
        List<CloudRole> cloudRoles = cloudUserRoleMapper.queryUserRoles(user.getId());
        List<Map> roles = cloudRoles.stream().map(r -> {
            Map map = new HashMap();
            map.put("id", r.getCode());
            map.put("name", r.getName());
            // Fixme 需要获取权限列表
            map.put("premissions", new ArrayList<>());
            return map;
        }).collect(Collectors.toList());
        Map<String, Object> resultMap = Maps.newTreeMap();
        resultMap.put("id", user.getId());
        resultMap.put("username", user.getLoginName());
        resultMap.put("name", user.getName());
        resultMap.put("role", roles);
        resultMap.put("avatar", "/avatar2.jpg");
        resultMap.put("premissions", new ArrayList<>());


        return ResponseResult.ok(resultMap);
    }

    @GetMapping("/user/nav")
    @ResponseBody
    private ResponseResult userNaV() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        String username = (String) authentication.getPrincipal();
        CloudUser cloudUser = cloudUserMapper.selectOne(new LambdaQueryWrapper<CloudUser>().eq(CloudUser::getLoginName, username));
        List<CloudModule> modules = cloudUserMapper.queryUserModule(cloudUser.getId());
        List<Map> permission = modules.stream().filter(distinctByKey(CloudModule::getId)).map(module -> {
            Map m = new HashMap();
            m.put("id", module.getId());
            m.put("name", module.getCode());
            m.put("parentId", module.getParentId());
            m.put("component", module.getComponent());
            m.put("path",module.getPath());
            if (!StringUtils.isEmpty(module.getRedirect())){
                m.put("redirect", module.getRedirect());
            }
            Map subMap = new HashMap();
            subMap.put("icon", module.getIconClass());
            subMap.put("title", module.getTitle());
            m.put("meta", subMap);
            return m;
        }).collect(Collectors.toCollection(ArrayList::new));


        return ResponseResult.ok(permission);
    }


}
