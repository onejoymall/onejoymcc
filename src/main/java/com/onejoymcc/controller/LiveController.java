package com.onejoymcc.controller;

import com.onejoymcc.board.common.SearchVO;
import com.onejoymcc.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.*;
@Controller
@RequestMapping("/")
public class LiveController {
    @Autowired
    ProductDAO productDAO;
    @RequestMapping(value = "/")
    public String liveMain(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{
            if(searchVO.getDisplayRowCount()==null || searchVO.getDisplayRowCount() < 12){
                searchVO.setDisplayRowCount(12);
            }
            // 기본정렬
            if(searchVO.getOrderByValue()==null || searchVO.getOrderByKey()==null){
                searchVO.setOrderByKey("product_id");
                searchVO.setOrderByValue("DESC");
            }

            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            searchVO.setPd_category_id(searchVO.getProduct_ct());
            List<Map<String,Object>> list = productDAO.getProductList(searchVO);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
//        model.addAttribute("style","live-shopping-category");
        model.addAttribute("style","live-shopping-new");
//       return "live/live-shopping-category";
        return "live/live-shopping-new";
    }
    @RequestMapping(value = "/view")
    public String liveView(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{

        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style","product-page");
        return "live/product-page";
    }
}
