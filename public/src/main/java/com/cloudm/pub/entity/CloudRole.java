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
@ApiModel(value="CloudRole对象", description="")
public class CloudRole extends CloudmEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "编号")
    private String code;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "组织")
    private Long orgId;

    @ApiModelProperty(value = "父id")
    private Long parentId;

    @ApiModelProperty(value = "角色分类")
    private String category;

    @ApiModelProperty(value = "是否显示")
    private Boolean visible;

    @ApiModelProperty(value = "层次编号")
    private String autocode;

    private String extendField1;

    private String extendField2;

    private String extendField3;

    private String extendField4;

    private String extendField5;

    private String extendField6;

    private String extendField7;

    private String extendField8;


}
