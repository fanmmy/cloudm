package com.cloudm.pub.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cloudm.pub.entity.CloudModule;
import com.cloudm.pub.service.ICloudModuleService;
import com.cloudm.pub.vo.ResponseResult;
import com.cloudm.uid.component.UidGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author fanmingyong
 * @since 2020-03-25
 */
@Controller
@RequestMapping("/cloud-module")
public class CloudModuleController {
    @Autowired
   private ICloudModuleService cloudModuleService;
    @Autowired
    private UidGenerator uidGenerator;

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult addMoudle(@RequestBody CloudModule cloudModule) {
        cloudModule.setId(uidGenerator.genUid());
        cloudModuleService.save(cloudModule);
        return ResponseResult.ok("操作成功");
    }

    @RequestMapping("/listForPage")
    @ResponseBody
    public ResponseResult listMoudle() {


        Page<CloudModule> page = cloudModuleService.page(new Page<CloudModule>(1, 2));

        return ResponseResult.okPage(page);
    }

}
