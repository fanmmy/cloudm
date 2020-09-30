package com.cloudm.uid.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@ConfigurationProperties("cloudm.uid")
public class UidProperties {
    private int timeBits = 29;
    private int workerBits = 21;
    private int seqBits = 13;
    private String generator = "defaultUidGenerator";
}
