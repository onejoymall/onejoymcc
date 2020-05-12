package com.onejoymcc.common.security.dao;

import com.onejoymcc.common.security.model.UserInfo;

public interface UserInfoDao {

    public UserInfo selectUserInfo(String usrId);
    
}
