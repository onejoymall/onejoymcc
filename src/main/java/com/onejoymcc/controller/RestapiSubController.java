package com.onejoymcc.controller;

import com.onejoymcc.common.security.model.UserInfo;
import com.onejoymcc.common.support.MailSender;
import com.onejoymcc.common.support.MessageSource;
import com.onejoymcc.common.support.NumberGender;
import com.onejoymcc.dao.CouponDAO;
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
    @Autowired
    private CouponDAO couponDAO;
    @Autowired
    private NumberGender numberGender;

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

    //이메일 인증번호 전송
    @RequestMapping(value = "/sign/authemail", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> authemail(@RequestParam HashMap params,UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        String memo;
        String subject =  messageSource.getMessage("authSendMailTitle","ko");//
        memo = messageSource.getMessage("atuhSendMailContent","ko");//

        try {

            //이메일 필수 체크
            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }

            //이메일 유효성검사
            String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
            Boolean emailValidation = userVO.getEmail().matches(regex);
            if(emailValidation){
                //이메일 중복확인
//                params.put("email",userVO.getEmail());
                params.put("password",null);
                params.put("phone",null);
                Map<String, Object> userData= userDAO.getLoginUserList(params);
                //Spring 4.3 이후부터 import static org.springframework.util.CollectionUtils.isEmpty; 추가로 간단이 Map 의 null체크가 가능하다
                if(!isEmpty(userData)){
                    //이메일 중복 메세지 출력
                    error.put("email", messageSource.getMessage("error.exsnIdExst","ko"));
                }
            }else{
                error.put("email", messageSource.getMessage("error.emailForm","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                String basePassword = numberGender.numberGen(4,2);
                //중복이 아니면 메일전송
                mailSender.sendSimpleMessage(userVO.getEmail(), subject, memo+" : "+basePassword);
                //메일이 정상 적으로 전송되면 회원 이메일과 인증코드를 저장하고 상태를 변경한다.
                params.put("email_auth_code",basePassword);
                userDAO.insertEmailAuth(params);
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //이메일 인증 번호학인
    @RequestMapping(value = "/sign/authEmailProc", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> authEmailProc(@RequestParam HashMap params,UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getEmail_auth_code()==null){
                error.put("email_auth_code", messageSource.getMessage("error.required","ko"));
            }else{
                Map<String, Object> getAuthCode= userDAO.getEmailAuthCode(userVO);
                //이메일 인증실패
                if(isEmpty(getAuthCode)){
                    error.put("email_auth_code", messageSource.getMessage("error.emailResultFail","ko"));
                }else{
                    Integer resultAuthCode = Integer.parseInt((String)getAuthCode.get("email_auth_code"));
                    if(!resultAuthCode.equals(userVO.getEmail_auth_code())){
                        error.put("email_auth_code", messageSource.getMessage("error.notVldtAthrzCd","ko"));
                    }
                }
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //회원 가입 처리
    @RequestMapping(value = "/sign/signupProc", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> signupProc(@RequestParam HashMap params, UserVO userVO){

        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getEmail_auth_code()==null){
                error.put("email_auth_code", messageSource.getMessage("error.required","ko"));
            }else{
                Map<String, Object> getAuthCode= userDAO.getEmailAuthCode(userVO);
                //이메일 인증실패
                if(isEmpty(getAuthCode)){
                    error.put("email_auth_code", messageSource.getMessage("error.emailResultFail","ko"));
                }else{
                    Integer resultAuthCode = Integer.parseInt((String)getAuthCode.get("email_auth_code"));
                    if(!resultAuthCode.equals(userVO.getEmail_auth_code())){
                        error.put("email_auth_code", messageSource.getMessage("error.notVldtAthrzCd","ko"));
                    }
                }
            }
            if(userVO.getPassword().isEmpty()){
                error.put("password", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getPassword_cf().isEmpty()){
                error.put("password_cf", messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                params.put("password", passwordEncoder.encode((String)params.get("password")));
                userDAO.insertUser(params);
                userVO.setLog_type("join");
                userDAO.insertUserHistory(userVO);
                resultMap.put("redirectUrl", "/sign/signUpDone");

                params.put("coupon_condition","J");
                params.put("login_alert_yn","");
                params.put("email_alert_yn","Y");
                params.put("sms_alert_yn","");
                List<Map<String,Object>> joinCoupon = couponDAO.getCouponList(params);
                for(Map<String,Object> coupon:joinCoupon) {
                    mailSender.sendSimpleMessage(userVO.getEmail(), "쿠폰이 발급되었습니다", "["+coupon.get("coupon_name")+"] 쿠폰을 마이페이지에서 확인하세요.");
                }
            }

        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }


}
