package com.onejoymcc.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository("termnInfoDao")
public class TermnInfoDaoImpl implements com.onejoymcc.common.dao.TermnInfoDao {

	 @Autowired
     private SqlSession sqlSession;
  
     public void setSqlSession(SqlSession sqlSession){
         this.sqlSession = sqlSession;
     }
     
     @Override
     public String selectTrcnId(HashMap<String, String> hMap){
         return sqlSession.selectOne("idCheckMapper.selectTrcnId", hMap);
     }
	
}
