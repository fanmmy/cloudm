package com.cloudm.pub.dto;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import lombok.Data;
import org.springframework.lang.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.function.Predicate;

/**
 * @author fanmingyong
 */
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//
@Data
public class Page<T> {
    private static final long serialVersionUID = 8545996863226528798L;
    private List<T> data;
    private long totalCount;//数据总数
    private long pageNo;//当前页数
    private long totalPage;//总页数
    private long pageSize;//每页条数

    public Page(com.baomidou.mybatisplus.extension.plugins.pagination.Page<T> iPage) {
        this.data = iPage.getRecords();
        this.pageSize = iPage.getSize();
        this.pageNo = iPage.getCurrent();
        this.totalPage = iPage.getPages();
        this.totalCount = iPage.getTotal();
    }
}
