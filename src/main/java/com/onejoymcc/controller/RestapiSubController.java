package com.onejoymcc.controller;

import com.onejoymcc.common.security.model.UserInfo;
import com.onejoymcc.common.support.MailSender;
import com.onejoymcc.common.support.MessageSource;
import com.onejoymcc.dao.UserDAO;
import com.onejoymcc.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.util.CollectionUtils.isEmpty;

@RestController
public class RestapiSubController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;
/*
    @Autowired
    private CouponDAO couponDAO;
    @Value("${downloadPath}")
*/



    //로그인 처리 1
    @RequestMapping(value = "/sign/loginProc", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> loginProc(@RequestParam HashMap params, HttpSession session, UserInfo userInfo, UserVO userVO){
        Map<String, Object> postToken = null;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {

            String email = (String)params.get("email");
            String password =(String)params.get("password");
            params.put("password",null);//패스워드 초기화
            if(email.isEmpty() || password.isEmpty()){
                resultMap.put("message", messageSource.getMessage("error.required","ko"));
            }else{
//                params.put("password",passwordEncoder.encode((String)params.get("password")));

                //Spring Security 5 단방향 암호화 패스워드 일치 확인 을 위해 이메일로 사용자정보를 가져온후 처리
                Map<String,Object> loginUserList = userDAO.getLoginUserList(params);
                Object RefererUrl = session.getAttribute("RefererUrl");
                if(!isEmpty(loginUserList)){

                    if(passwordEncoder.matches(password,(String)loginUserList.get("password"))){
                        if ( session.getAttribute("login") != null ){
                            // 기존에 login이란 세션 값이 존재한다면
                            session.removeAttribute("login"); // 기존값을 제거해 준다.
                        }
                        if ( userInfo != null ){ // 로그인 성공
                            userInfo.setLogin(true);
                            userInfo.setUserName(email);
                            session.setAttribute("email",email);
                            session.setAttribute("login", true); //
                            session.setAttribute("userInfo",userInfo);
                            //로그인 기록 저장
                            userVO.setLog_type("login");
                            userDAO.insertUserHistory(userVO);
                           if(RefererUrl!=null){
                               resultMap.put("redirectUrl",RefererUrl);
                           }else{
                               resultMap.put("redirectUrl", "/");
                           }

                        }
//                        else { // 로그인에 실패한 경우
//                            resultMap.put("redirectUrl", "/login");
//                        }
                        //최초 로그인시 토큰저장(지금은 안써도됨)
//                        postToken = CurlPost.curlPostFn("http://127.0.0.1:8080/oauth/token?client_id=clientapp&grant_type=password&username="+email+"&password="+password,"application/json","application/x-www-form-urlencoded");
//                        params.put("access_token",postToken.get("access_token"));
//                        userDAO.updateToken(params);
//                        resultMap.put("access_token",postToken.get("access_token"));
                    }else{
                        resultMap.put("message", messageSource.getMessage("error.notUsrInfo","ko"));
                    }
                }else{
                    resultMap.put("message", messageSource.getMessage("error.notUsrInfo","ko"));
                }

            }
//
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }




}
