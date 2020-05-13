package com.onejoymcc.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.onejoymcc.board.common.SearchVO;
import com.onejoymcc.dao.CartDAO;
import com.onejoymcc.dao.CategoryDAO;
import com.onejoymcc.dao.ProductDAO;
import com.onejoymcc.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.*;

import static org.springframework.util.CollectionUtils.isEmpty;

import com.onejoymcc.common.dao.SelectorDAO;
import com.onejoymcc.dao.ConfigDAO;
import com.onejoymcc.dao.ProductDAO;
import com.onejoymcc.dao.ReviewDAO;
@Controller
@RequestMapping("/")
public class LiveController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    CartDAO cartDAO;
    @Autowired
    ConfigDAO configDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    ReviewDAO reviewDAO;
    @RequestMapping(value = "/")
    public String liveMain(@RequestParam HashMap params, ModelMap model, SearchVO searchVO, HttpServletRequest request) throws Exception {
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
            searchVO.setProduct_sale_yn("Y");
            List<Map<String,Object>> productList = productDAO.getProductList(searchVO);
            model.addAttribute("productList", productList);
            model.addAttribute("searchVO", searchVO);

            //할인
            searchVO.setProduct_sale_yn("Y");
            searchVO.setMainViewType("product_sp_class");
            List<Map<String,Object>> productSpList = productDAO.getProductList(searchVO);
            model.addAttribute("productSpList", productSpList);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
//        model.addAttribute("style","live-shopping-category");
        model.addAttribute("style","live-shopping-new");
//       return "live/live-shopping-category";
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/live-shopping";
        } else {
            return "live/live-shopping-new";
        }
    }
    @RequestMapping(value = "/view")
    public String liveView(@RequestParam HashMap params, ModelMap model, SearchVO searchVO, HttpServletRequest request) throws Exception {
        try{
        	Map<String,Object> list = productDAO.getProductViewDetail(params);

            model.addAttribute("list",list);

            searchVO.setDisplayRowCount(1);
            searchVO.pageCalculate(cartDAO.getFavoritesListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());

            List<Map<String,Object>> heart = cartDAO.getFavoritesList(params);
            if(!isEmpty(heart)){
                model.addAttribute("heart",true);
            }
            //배송정보
            params.put("delivery_class",list.get("product_delivery_class"));
            //배송밥법
            params.put("delivery_type",list.get("product_delivery_type"));
            //배송비구분
            params.put("delivery_payment_class",list.get("product_delivery_payment_class"));
            //배송비 구분별 값
            params.put("delivery_payment",list.get("product_delivery_payment"));
            Map<String,Object> delivery = giveawayDelivery(params);

            model.addAttribute("delivery",delivery);
            model.addAttribute("delivery_type_list", delivery.get("selector"));
            //상품을 처음 볼뗀 구매수량이 1
            list.put("payment_order_quantity","1");
            Integer deliveryPayment = deliveryPayment(list);
            model.addAttribute("deliveryPayment",deliveryPayment);
            //옵션
            params.put("product_option_style",list.get("product_option_style"));
            params.put("product_option_input",list.get("product_option_input"));
            String option = getOption(params);
            model.addAttribute("option",option);
            //리뷰
//            model.addAllAttributes("reviews",reviewDAO.get)
            //서비스안내
            params.put("store_id",list.get("store_id"));
            params.put("market_config_code", "market-config-partner-top");
            Map<String,Object> configtop = configDAO.getConfigDetail(params);
            params.put("market_config_code", "market-config-partner-bot");
            Map<String,Object> configbot = configDAO.getConfigDetail(params);
            model.addAttribute("configtop",configtop);
            model.addAttribute("configbot",configbot);

            //리뷰
            searchVO.setDisplayRowCount(1000);
            searchVO.setStaticRowEnd(1000);
            searchVO.pageCalculate(reviewDAO.getReviewForProductListCount(params));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            params.put("displayRowCount", searchVO.getDisplayRowCount());

            List<Map<String,Object>> reviewList = reviewDAO.getReviewForProductList(params);

            int[] scoreArr = new int[reviewList.size()];
            for(int i=0; i<reviewList.size(); i++) {
            	scoreArr[i] = (int)reviewList.get(i).get("review_score");
            }

            model.addAttribute("reviewList", reviewList);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("scoreAvg", Arrays.stream(scoreArr).average().getAsDouble());
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style","product-page");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/live-view";
        } else {
            return "live/product-page";
        }
    }

    //배송비
    public Integer deliveryPayment( Map<String,Object> params)throws IOException {
        Integer deliveryPayment=0;
        try{
            //배송방법이 없으면 입력값 고정 출력
            if(params.get("product_delivery_class").equals("F") ){
                deliveryPayment=0;
            }else {
                //배송방법이 개별이면 사용자 선택
                String splitString = (String)params.get("product_delivery_type");//배송방법
                String[] splitArray = splitString.split( "\\|");
                //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
                params.put("code","product_delivery_type");
                params.put("code_values",splitArray);
                List<Map<String,Object>> selector = selectorDAO.getSelector(params);
                params.put("selector",selector);
            }

            //관리자가 지정한 배송구분별 배송비용을 출력한다.
            String splitDeliveryPaymentString=(String)params.get("product_delivery_payment");//구분별 배송비
            String splitDeliveryPaymentTypeString=(String)params.get("product_delivery_payment_type");//구분별 배송비
            String delivery_payment_class = (String) params.get("product_delivery_payment_class");
            Integer product_payment =(Integer)params.get("product_payment");
            Integer product_kg = Integer.parseInt((String)params.get("product_kg"));
            Integer payment_order_quantity = Integer.parseInt((String)params.get("payment_order_quantity"));
            if ("T".equals(delivery_payment_class)) {
                deliveryPayment=0;
            } else if ("R".equals(delivery_payment_class)) {
                deliveryPayment = Integer.parseInt(splitDeliveryPaymentString);
            } else if ("M".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeM = splitDeliveryPaymentString.split("\\|");
                if(product_payment <= Integer.parseInt(splitDeliveryTypeM[0])){
                    deliveryPayment = Integer.parseInt(splitDeliveryTypeM[1]);
                }
            } else if ("D".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeD = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeD.length; i++) {
                    if(product_payment <= Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0]) && product_payment > Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2]);
                    }
                }
            } else if ("W".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeW = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeW.length; i++) {
                    if(product_kg >= Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0]) && product_kg > Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2]);
                    }
                }

            } else if ("C".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeC = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeC.length; i++) {
                    if(payment_order_quantity >= Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0]) && payment_order_quantity > Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2]);
                    }
                }
            }
            if("C".equals(splitDeliveryPaymentTypeString)) {
            	deliveryPayment=0;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return deliveryPayment;
    }
    //배송정보 출력
    public Map<String ,Object> giveawayDelivery(HashMap params)throws SQLException {

        //배송방법이 없으면 입력값 고정 출력
        if(params.get("delivery_class").equals("F") ){
            params.put("selector","기본배송");
        }else {
            //배송방법이 개별이면 사용자 선택
            String splitString = (String)params.get("delivery_type");//배송방법
            String[] splitArray = splitString.split( "\\|");
            //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
            params.put("code","product_delivery_type");
            params.put("code_values",splitArray);
            List<Map<String,Object>> selector = selectorDAO.getSelector(params);
            params.put("selector",selector);
        }

        //관리자가 지정한 배송구분별 배송비용을 출력한다.
        String splitDeliveryPaymentString=(String)params.get("delivery_payment");//구분별 배송비
        String deliveryPutString="";
        String delivery_payment_class = (String) params.get("delivery_payment_class");
        if ("T".equals(delivery_payment_class)) {
            params.put("delivery_payment", "배송비 무료");
        } else if ("R".equals(delivery_payment_class)) {
            params.put("delivery_payment", "배송비 " + String.format("%,d", Integer.parseInt(splitDeliveryPaymentString)) + "원");
        } else if ("M".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeM = splitDeliveryPaymentString.split("\\|");
            params.put("delivery_payment", "결재금액 "
                    + String.format("%,d", Integer.parseInt(splitDeliveryTypeM[0])) + "원 이하 / 배송비"
                    + String.format("%,d", Integer.parseInt(splitDeliveryTypeM[1])) + " 원");
        } else if ("D".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeD = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeD.length; i++) {
                deliveryPutString += "결재금액 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0])) + "원 ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1])) + "원 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        } else if ("W".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeW = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeW.length; i++) {
                deliveryPutString += ""
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0])) + "kg ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1])) + "kg 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        } else if ("C".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeC = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeC.length; i++) {
                deliveryPutString += ""
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0])) + "ea ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1])) + "ea 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        }
        return params;
    }
    //옵션
    public String getOption(HashMap params)throws Exception{
        String outText="";
        try{
//            String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
//             .replaceAll(" " , "")
//             .replaceAll("\\p{Z}", "")
//             .replaceAll(match, "")
            String product_option_style = (String) params.get("product_option_style");
            String splitString = (String) params.get("product_option_input");//배송방법
            String[] splitStyleArray =product_option_style.split("\\,");
            String[] splitArray =splitString.split("\\/\\/");

            if(splitArray.length > 0){
                outText += "" +
                        "<div class=\"goods-point-row\">\n" +
                        "   <div class=\"point-title\">옵션선택</div>\n" +
                        "</div>";
                outText += "" +
                        "<div class=\"goods-point-row\">\n" +
                        "   <div class=\"point-title\">&nbsp;</div>\n" +
                        "</div>";
            }
            for(int z=0;z < splitArray.length;z++){

                String[] splitNextArray =splitArray[z]
                        .split("\\{");
                String[] splitThirdArray = splitNextArray[1]
                        .replaceAll("\\}", "")
                        .split("\\|");
                if(splitStyleArray[z].equals("P") || splitStyleArray[z].isEmpty()){
                    outText += "" +
                            "<select name=\"select_option_value\" class=\"option-box width-100 my-1\">"
                            + "<option selected>옵션 선택</option>";
                    //옵션 스타일에 따라 다르게
                    for (int i = 0; i < splitThirdArray.length; i++) {
                        outText += "" +
                                "   <option value=\""+splitThirdArray[i]+"\">"+splitThirdArray[i]+"</option>\n";
                    }
                    outText += "" +
                            "</select>";
                }
                if(splitStyleArray[z].equals("B")){
                    outText += "" +
                            "<div class=\"option-box2 mb-1\">" +
                            "<div class=\"point-title text-gray\">" + splitNextArray[0] + " 선택 </div>\n" +
                            "<div class=\"optionBtn-wrap\">\n";

                    for (int i = 0; i < splitThirdArray.length; i++) {
                        outText += ""  +
                                "   <button type=\"button\" class=\"optionBtn\" >"+splitThirdArray[i]+"</button>";
                    }
                    outText += "" +
                                "</div>\n" +
                            " </div>";
                }
                if(splitStyleArray[z].equals("R")){
                    outText += "" +
                            "<div class=\"option-box2 mb-1\">" +
                            " <div class=\"point-title text-gray\">" +
                            ""+splitNextArray[0]+" 선택 </div>"
                            + "<div class=\"optionBtn-wrap\">\n";

                    for (int i = 0; i < splitThirdArray.length; i++) {
                        outText += "" +
                            "<input type=\"radio\" id=\"rdOption"+i+"\" name=\"rdOption\"><label for=\"rdOption"+i+"\" class=\"ra-icon\">"+splitThirdArray[i]+"</label>";
                    }
                    outText += "" +
                                "</div></div>\n" ;
                }
            }



        }catch (Exception e){
            e.printStackTrace();
        }
        return outText;
    }

    @RequestMapping(value = "/mobile/layout/main-header")
    public String MmainTopNav(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception{
        try{
            // 카테고리 출력
            params.put("pd_category_upper_code","T");
            params.put("pd_category_main_view","Y");
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            params.put("pd_category_upper_code",null);
            List<Map<String,Object>> subList = categoryDAO.getCategorySubList(params);
            List<Map<String,Object>> thirdList = categoryDAO.getCategoryThirdList(params);
            model.addAttribute("categoryList",categoryList);
            model.addAttribute("subList",subList);
            model.addAttribute("thirdList",thirdList);

            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("cart_user_id",userInfo.get("usr_id"));
            }

            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getTopCartListCount(params));


            model.addAttribute("searchVO", searchVO);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/layout/main-header";

    }

    @RequestMapping(value = "/mobile/layout/sub-header")
    public String MsubTopNav(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception{
        try{
            // 카테고리 출력
            params.put("pd_category_upper_code","T");
            params.put("pd_category_main_view","Y");
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            params.put("pd_category_upper_code",null);
            List<Map<String,Object>> subList = categoryDAO.getCategorySubList(params);
            List<Map<String,Object>> thirdList = categoryDAO.getCategoryThirdList(params);
            model.addAttribute("categoryList",categoryList);
            model.addAttribute("subList",subList);
            model.addAttribute("thirdList",thirdList);

            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("cart_user_id",userInfo.get("usr_id"));
            }

            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getTopCartListCount(params));

//            todayVO.setProduct_cd_array(new String[]{"string1"});


            model.addAttribute("searchVO", searchVO);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/layout/sub-header";

    }
}
