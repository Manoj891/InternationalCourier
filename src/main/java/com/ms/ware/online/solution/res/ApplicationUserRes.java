package com.ms.ware.online.solution.res;

import com.ms.ware.online.solution.entity.Branch;

public interface ApplicationUserRes {

    Integer getId();

    String getUsername();

    String getUsertype();

    String getEmail();

    String getMobileNo();

    Integer getBranch();

    Branch getBm();
}
