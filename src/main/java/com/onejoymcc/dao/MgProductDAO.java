package com.onejoymcc.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onejoymcc.board.common.FileVO;
import com.onejoymcc.vo.CommonVO;
import com.onejoymcc.vo.ProductVO;
@Repository
public class MgProductDAO {

    @Autowired
    private SqlSession sql;
    public Map<String,Object> getProductViewDetail(Map<String,Object> params) throws SQLException {
        Map<String,Object> getProductViewDetail=sql.selectOne("mall.ProductMapper.getProductViewDetail",params);
        return getProductViewDetail;
    }
    public void insertProduct(ProductVO productVO) throws SQLException{
        sql.insert("mall.ProductMapper.insertProduct",productVO);
    }
    public void insertProductFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("mall.ProductMapper.insertProductFile", f);
        }
    }
    public void insertProductCopy(Map<String,Object> params) throws Exception{
        sql.insert("mall.ProductMapper.insertProductCopy",params);
    }
    public void insertProductFileCopy(Map<String,Object> params) throws Exception{
        sql.insert("mall.ProductMapper.insertProductFileCopy",params);
    }
    public void updateProduct(ProductVO productVO) throws SQLException{
        sql.update("mall.ProductMapper.updateProduct",productVO);
    }

    public  void deleteProductFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.delete("mall.ProductMapper.deleteProductFile",f);
        }

    }
    public void updateProductList(CommonVO commonVO)throws SQLException{
        sql.insert("mall.ProductMapper.updateProductList", commonVO);
    }
}
