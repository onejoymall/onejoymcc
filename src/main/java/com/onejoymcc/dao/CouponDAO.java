package com.onejoymcc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class CouponDAO {
    @Autowired
    private SqlSession sql;

    public List<Map<String, Object>> getCouponList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCouponList = sql.selectList("mall.CouponMapper.getCouponList",params);
        return getCouponList;
    }



}
