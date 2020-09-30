package com.cloudm.pub.entity;

import java.time.LocalDateTime;
import com.cloudm.pub.entity.CloudmEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author fanmingyong
 * @since 2020-03-25
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value="CloudUser对象", description="")
public class CloudUser extends CloudmEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "员工编号")
    private String code;

    @ApiModelProperty(value = "姓名")
    private String name;

    private Long orgId;

    private Long deptId;

    private Long workOrgId;

    private Long workDeptId;

    private String loginName;

    private String password;

    private LocalDateTime changePwdDate;

    private LocalDateTime lastVisitDate;

    private Integer pwdErrorCount;

    private String duty;

    private String title;

    private String officeAddress;

    private String email;

    private String phone;

    private LocalDateTime dimissiondate;

    private String adminLevel;

    private String extendField1;

    private String extendField2;

    private String extendField3;

    private String extendField4;

    private String extendField5;

    private String extendField6;

    private String extendField7;

    private String extendField8;


}
