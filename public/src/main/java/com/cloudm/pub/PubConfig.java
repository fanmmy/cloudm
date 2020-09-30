package com.cloudm.pub;

import com.baomidou.mybatisplus.extension.spring.MybatisSqlSessionFactoryBean;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author fanmingyong
 */
@Configuration
@MapperScan("com.cloudm.pub.mapper")
@ComponentScan("com.cloudm.pub")
@Slf4j
public class PubConfig {

}
