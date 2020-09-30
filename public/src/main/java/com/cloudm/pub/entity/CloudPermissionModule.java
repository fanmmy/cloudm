package com.cloudm.pub.entity;

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
@ApiModel(value="CloudPermissionModule对象", description="")
public class CloudPermissionModule extends CloudmEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "是否是用户")
    private Boolean userMode;

    @ApiModelProperty(value = "角色人员ID")
    private Long resourceId;

    @ApiModelProperty(value = "模块ID")
    private Long moduleId;


}
