package com.cloudm.pub.entity;

import lombok.Data;

/**
 * @author fanmingyong
 */
@Data
public class CloudmEntity {
    protected Long id;
    protected String description;
    protected Long sortcode;
    protected Boolean enabled = true;

}
