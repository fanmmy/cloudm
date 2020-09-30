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
@ApiModel(value="CloudOrg对象", description="")
public class CloudOrg extends CloudmEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "编号")
    private String code;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "简称")
    private String shortName;

    @ApiModelProperty(value = "分类")
    private String category;

    private Long parentId;

    @ApiModelProperty(value = "层次编号")
    private String autocode;

    @ApiModelProperty(value = "模块组织")
    private Long moduleOrgId;

    @ApiModelProperty(value = "参数组织")
    private Long parameterOrgId;

    @ApiModelProperty(value = "编码组织")
    private Long itemsOrgId;

    private String extendField1;

    private String extendField2;

    private String extendField3;

    private String extendField4;

    private String extendField5;

    private String extendField6;

    private String extendField7;

    private String extendField8;


}
