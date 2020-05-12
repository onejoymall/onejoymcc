package com.onejoymcc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onejoymcc.board.common.SearchVO;
import com.onejoymcc.dao.CategoryDAO;
import com.onejoymcc.dao.MgSystemDAO;
import com.onejoymcc.vo.MgDeliveryVO;

@Controller
@RequestMapping("/Creator")
public class CreatorController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private MgSystemDAO mgSystemDAO;
	
	
	
	@RequestMapping(value = "/productList")
    public String productList(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
    	try{
    		
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "goods");
    	return "product/index";
    }
	
	@RequestMapping(value = "/productAdd")
	public String productAdd(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,MgDeliveryVO mgDeliveryVO,HttpSession session) throws Exception {
        try {
            Object adminLogin = session.getAttribute("adminLogin");
            params.put("pd_category_upper_code", "T");
            if(adminLogin != null && adminLogin.equals("admin")){
                mgDeliveryVO.setStore_id("admin");
            }else {
            	mgDeliveryVO.setStore_id("admin");
            }
            Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
            model.addAttribute("detail", detail);

            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods-add");
            model.addAttribute("postUrl", "/Manager/productAddProc");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return "product/productAdd";
    }
}
