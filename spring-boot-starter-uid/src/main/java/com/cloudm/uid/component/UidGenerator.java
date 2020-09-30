package com.cloudm.uid.component;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class UidGenerator {

    private com.baidu.fsg.uid.UidGenerator uidGenerator;

    public long genUid() {
        return uidGenerator.getUID();
    }

    public String parseUid(long uid) {
        return uidGenerator.parseUID(uid);
    }
}
