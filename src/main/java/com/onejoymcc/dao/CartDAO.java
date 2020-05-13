package com.onejoymcc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onejoymcc.vo.CartPaymentVO;

@Repository
public class CartDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getFavoritesList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getFavoritesList = sql.selectList("mall.CartMapper.getFavoritesList",params);
        return getFavoritesList;
    }
    public Integer getFavoritesListCount(Map<String, String> params) throws SQLException {
        Integer getFavoritesListCount=sql.selectOne("mall.CartMapper.getFavoritesListCount",params);
        return getFavoritesListCount;
    }
}
