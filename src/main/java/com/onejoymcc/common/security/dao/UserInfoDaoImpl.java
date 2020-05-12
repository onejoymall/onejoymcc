package com.onejoymcc.common.security.dao;

import com.onejoymcc.common.security.model.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userInfoDao")
public class UserInfoDaoImpl implements UserInfoDao{

	 @Autowired
     private SqlSession sqlSession;
  
     public void setSqlSession(SqlSession sqlSession){
         this.sqlSession = sqlSession;
     }
     
     
     @Override
     public UserInfo selectUserInfo(String usrId) {
    	 return sqlSession.selectOne("userMngMapper.selectUserInfo", usrId);
     }
}
