package com.cloudm.pub.vo;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * @author fanmingyong
 */

@Data
public class ResponseResult implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 返回处理消息
     */
    private String message = "";
    /**
     * 返回代码
     */
    private int code = HttpStatus.OK.value();
    /**
     * 返回数据对象 data
     */
    private Object result;
    /**
     * 时间戳
     */
    private long timestamp = System.currentTimeMillis();

    /**
     * @description:构造函数
     * @author: zhangsui
     * @date: 2019年8月17日上午9:18:32
     * @modify:
     */
    public ResponseResult() {
    }




    public static ResponseResult error(HttpStatus code, String msg) {
        ResponseResult result = new ResponseResult();
        result.setCode(code.value());
        result.setMessage(msg);
        return result;
    }



    public static ResponseResult ok(String msg) {
        ResponseResult result = new ResponseResult();
        result.setCode(HttpStatus.OK.value());
        result.setMessage(msg);
        return result;
    }


    public static ResponseResult ok(Object data) {
        ResponseResult result = new ResponseResult();
        result.setCode(HttpStatus.OK.value());
        result.setMessage("操作成功！");
        result.setResult(data);
        return result;
    }

    public static ResponseResult okPage(Page data) {
        ResponseResult result = new ResponseResult();
        result.setCode(HttpStatus.OK.value());
        result.setMessage("操作成功！");
        result.setResult(new com.cloudm.pub.dto.Page<>(data));
        return result;
    }

    public static ResponseResult ok(String msg, Object data) {
        ResponseResult result = new ResponseResult();
        result.setCode(HttpStatus.OK.value());
        result.setMessage(msg);
        result.setResult(data);
        return result;
    }
}


