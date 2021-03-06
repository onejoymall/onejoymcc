package com.onejoymcc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onejoymcc.board.common.FileVO;

@Repository
public class ReviewDAO {
    @Autowired
    private SqlSession sql;
    public Map<String, Object> getReviewDetail(Map<String, String> params) throws SQLException {
        Map<String, Object> getReviewDetail = sql.selectOne("mall.ReviewMapper.getReviewDetail",params);
        return getReviewDetail;
    }
    public List<Map<String, Object>> getReviewList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getReviewList = sql.selectList("mall.ReviewMapper.getReviewList",params);
        return getReviewList;
    }
    public int getReviewListCount(Map<String, String> params) throws SQLException {
    	int getReviewListCount = sql.selectOne("mall.ReviewMapper.getReviewListCount",params);
    	return getReviewListCount;
    }
    public List<Map<String, Object>> getReviewForProductList(Map<String, String> params) throws SQLException {
    	List<Map<String, Object>> getReviewForProductList = sql.selectList("mall.ReviewMapper.getReviewForProductList",params);
    	return getReviewForProductList;
    }
    public int getReviewForProductListCount(Map<String, String> params) throws SQLException {
    	int getReviewForProductListCount = sql.selectOne("mall.ReviewMapper.getReviewForProductListCount",params);
    	return getReviewForProductListCount;
    }
    
    public void insertReview(Map<String, String> params) throws SQLException {
        sql.insert("mall.ReviewMapper.insertReview",params);
    }
    public void updateReview(Map<String, String> params) throws SQLException {
    	sql.update("mall.ReviewMapper.updateReview",params);
    }
    public void deleteReview(Map<String, String> params) throws SQLException {
    	sql.delete("mall.ReviewMapper.deleteReview",params);
    }
    public void insertReviewFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("mall.ReviewMapper.insertReviewFile", f);
        }
    }
    public  void deleteReviewFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.delete("mall.ReviewMapper.deleteReviewFile",f);
        }

    }
    public void deleteReviewFile(FileVO fileVO) throws SQLException{
        sql.delete("mall.ReviewMapper.deleteReviewFileOne",fileVO);
    }
}
