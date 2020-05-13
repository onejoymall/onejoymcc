package com.onejoymcc.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.onejoymcc.board.app.BoardVO;
import com.onejoymcc.board.common.FileUtil;
import com.onejoymcc.board.common.FileVO;
import com.onejoymcc.common.support.MessageSource;
import com.onejoymcc.common.support.NumberGender;
import com.onejoymcc.dao.CategoryDAO;
import com.onejoymcc.dao.MgProductDAO;
import com.onejoymcc.vo.MgCommonVO;
import com.onejoymcc.vo.ProductVO;

@RestController
public class RestApiController {
	@Autowired
    private NumberGender numberGender;
    @Autowired
    private MgProductDAO mgProductDAO;
	@Autowired
    MessageSource messageSource;
	@Autowired
	CategoryDAO categoryDAO;
	@Value("${downloadPath}")
    private String downloadPath;
    @Value("${downloadEditorPath}")
    private String downloadEditorPath;
	
	//상푼분류
    @RequestMapping(value = "/Manager/productCategoryList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productCategoryList(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {

            List<Map<String,Object>> list = categoryDAO.getCategoryList(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    
  //상품등록
    @RequestMapping(value = "/Manager/productAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");
            //
            String product_cd = "P"+numberGender.numberGen(7,2);
            productVO.setProduct_cd(product_cd);


            if(productVO.getProduct_name().isEmpty()){
                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
            if(productVO.getProduct_company_payment() == null){
                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(productVO.getProduct_payment() == null){
                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    mgProductDAO.deleteProductFile(filelist2,fileVO);
                    mgProductDAO.insertProductFile(filelist2,fileVO);
                }
                mgProductDAO.insertProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
}
