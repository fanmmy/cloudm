package com.cloudm.uid;

import com.baidu.fsg.uid.impl.CachedUidGenerator;
import com.baidu.fsg.uid.impl.DefaultUidGenerator;
import com.cloudm.uid.component.DisposableWorkerIdAssigner;
import com.cloudm.uid.component.UidGenerator;
import com.cloudm.uid.config.UidProperties;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@EnableConfigurationProperties(UidProperties.class)
@Configuration
@ConditionalOnClass(UidGenerator.class)
@MapperScan("com.cloudm.uid.mapper")
@Slf4j
public class UidConfig {

    @Autowired
    private DisposableWorkerIdAssigner disposableWorkerIdAssigner;

    @Autowired
    private UidProperties uidProperties;


    private boolean validateGenerator() {
        String generator = uidProperties.getGenerator();
        return "defaultUidGenerator".equals(generator) || "cachedUidGenerator".equals(generator);
    }




    @Bean
    @ConditionalOnMissingBean(DisposableWorkerIdAssigner.class)
    DisposableWorkerIdAssigner disposableWorkerIdAssigner() {
        return new DisposableWorkerIdAssigner();
    }


    @Bean
    @ConditionalOnMissingBean(UidGenerator.class)
    UidGenerator uidGenerator() {
        if (!this.validateGenerator()) {
            throw new RuntimeException("cloudm.uid.generator 不合法");
        }
        UidGenerator uidGenerator = new UidGenerator();

        if ("cachedUidGenerator".equals(uidProperties.getGenerator())) {
            CachedUidGenerator subGenerator = new CachedUidGenerator();
            this.initSubGenerator(subGenerator);
            uidGenerator.setUidGenerator(subGenerator);
        } else {
            DefaultUidGenerator subGenerator = new DefaultUidGenerator();
            this.initSubGenerator(subGenerator);

            uidGenerator.setUidGenerator(subGenerator);
        }
        return uidGenerator;
    }

    private void initSubGenerator(DefaultUidGenerator subGenerator) {
        subGenerator.setTimeBits(uidProperties.getTimeBits());
        subGenerator.setWorkerBits(uidProperties.getWorkerBits());
        subGenerator.setSeqBits(uidProperties.getSeqBits());
        subGenerator.setWorkerIdAssigner(disposableWorkerIdAssigner);
        subGenerator.setEpochStr(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        try {
            subGenerator.afterPropertiesSet();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
