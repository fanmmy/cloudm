package com.cloudm.pub.entity;

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
 * @since 2020-04-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value="CloudModule对象", description="")
public class CloudModule extends CloudmEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "父id")
    private Long parentId;

    @ApiModelProperty(value = "编号")
    private String code;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "是否强制隐藏子菜单")
    private Integer hideChildrenInMenu;

    @ApiModelProperty(value = "是否显示")
    private Integer viewable;

    @ApiModelProperty(value = "访问地址")
    private String path;

    @ApiModelProperty(value = "组件")
    private String component;

    @ApiModelProperty(value = "重定向URL")
    private String redirect;

    @ApiModelProperty(value = "参数")
    private String parameter;

    @ApiModelProperty(value = "图标地址")
    private String imageUrl;

    @ApiModelProperty(value = "图标样式")
    private String iconClass;

    private String extendField1;

    private String extendField2;

    private String extendField3;

    private String extendField4;

    private String extendField5;

    private String extendField6;

    private String extendField7;

    private String extendField8;


}
