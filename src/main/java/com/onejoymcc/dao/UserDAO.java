package com.onejoymcc.dao;

import com.onejoymcc.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
public class UserDAO {
    @Autowired
    private SqlSession sql;

    public Map<String, Object> getLoginUserList(Map<String, String> params) throws SQLException {
        Map<String, Object> getLoginUserList = sql.selectOne("mall.UserMapper.getUserList",params);
        return getLoginUserList;
    }

    public void insertUserHistory(UserVO userVO) throws SQLException{
        sql.insert("mall.UserMapper.insertUserHistory", userVO);
    }

    public Map<String, Object> getEmailAuthCode(UserVO userVO) throws SQLException {
        Map<String, Object> getEmailAuthCode = sql.selectOne("mall.UserMapper.getEmailAuthCode",userVO);
        return getEmailAuthCode;
    }

    public void insertUser(Map<String, String> params) throws SQLException {
        sql.insert("mall.UserMapper.insertUser", params);
    }

    public void insertEmailAuth(Map<String, String> params) throws SQLException {
        sql.insert("mall.UserMapper.insertEmailAuth", params);
    }
}
