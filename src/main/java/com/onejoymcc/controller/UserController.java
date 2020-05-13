package com.onejoymcc.controller;

import com.onejoymcc.common.support.MailSender;
import com.onejoymcc.common.support.MessageSource;
import com.onejoymcc.common.support.NumberGender;
import com.onejoymcc.dao.UserDAO;
import com.onejoymcc.vo.UserVO;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
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
import java.io.IOException;
import java.util.HashMap;

import static org.springframework.util.CollectionUtils.isEmpty;


@Controller
public class UserController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private UserDAO userDAO;

    //로그인
    @RequestMapping(value = "/sign/login", method = RequestMethod.GET, produces = "application/json")
    public String mallLogin(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
        String returnString ="mall/login";
//        Device device = DeviceUtils.getCurrentDevice(request);

        try{
            session.setAttribute("RefererUrl",request.getHeader("Referer"));

            Object siteUrl = request.getRequestURL().toString()
                    .replaceAll(" " , "")
                    .replace(request.getRequestURI(),"");

            Object obj = session.getAttribute("login");
            if ( obj != null ){
                returnString = "redirect:/";
            }
            model.addAttribute("siteUrl", siteUrl);
        }catch(Exception e){
            e.printStackTrace();
        }
/*        if(device.isMobile()){
            returnString = "mobile/login";
        }*/
        model.addAttribute("style", "login");
        return returnString;
    }

    // 로그아웃 하는 부분
    @RequestMapping(value="/sign/logout")
    public String logout(HttpSession session, UserVO userVO) throws IOException {

        String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost postRequest = new HttpPost(RequestUrl); //POST 메소드 URL
        postRequest.addHeader("Authorization", (String)session.getAttribute("token"));
        HttpResponse response = client.execute(postRequest);
        try {
            int responseCode = response.getStatusLine().getStatusCode();
            if (responseCode == 200) {
                ResponseHandler<String> handler = new BasicResponseHandler();
                handler.handleResponse(response);

            }
            userVO.setLog_type("logout");
            userVO.setEmail((String)session.getAttribute("email"));
            userDAO.insertUserHistory(userVO);
        }catch (Exception e){
            e.printStackTrace();
        }

        session.invalidate(); // 세션 초기화
        return "redirect:/sign/login"; // 로그아웃 후 로그인화면으로 이동
    }

    @RequestMapping(value = "/sign/signup")
    public String mallSignup(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();

        try{
            //
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "joinform");
        model.addAttribute("postUrl","/sign/signupProc");

        /*Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/join";
        } else {
            return "mall/signup";
        }*/
        return "mall/signup";
    }

    @RequestMapping(value = "/sign/signUpDone")
    public String signUpDone( ModelMap model,HttpServletRequest request,@RequestParam HashMap params)throws Exception{
        Device device = DeviceUtils.getCurrentDevice(request);
        model.addAttribute("style", "mem-com");
        if(device.isMobile()){
            return "mobile/mem-com";
        } else {
            return "mall/signUpDone";
        }
    }

}
