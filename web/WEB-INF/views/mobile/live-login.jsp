<%--
  Created by IntelliJ IDEA.
  User: YEYD
  Date: 2020-05-22
  Time: 오후 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
<div class="wrap">
    <form  name="defaultLoginForm" id="defaultLoginForm">
        <div class="mo-main login-main clearfix">
            <div class="mo-logo"><a href="/">onejoy life</a></div>
            <div class="mo-login-form">
                <form action="">
                    <input type="text" for="id-input" name="email" class="id-la" id="id-input" placeholder="아이디(이메일)">
                    <input type="password" for="pw-input" name="password" class="id-la" id="pw-input"  placeholder="비밀번호">
                    <span class="error" style="display: none;">회원 아이디 또는 비밀번호가 일치하지 않습니다.</span>
                    <div class="check-save">
                        <input type="checkbox" id="id-save" class="save-ck">
                        <label for="id-save"><span class="ck-img"></span>아이디 저장</label>
                        <input type="checkbox" id="auto-login" class="save-ck">
                        <label for="auto-login"><span class="ck-img"></span>자동 로그인</label>
                    </div>
                    <button type="button" class="btn-login">로그인</button>
                </form>
<%--                <a href="" class="btn-kakao-login"><i class="kakao-icon"></i>kakao 계정으로 로그인</a>--%>
                <br/>
                <div class="login-search">
                    <a href="">회원가입</a>
                    <span class="bar"></span>
                    <a href="">아이디 찾기</a>
                    <span class="bar"></span>
                    <a href="">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </form>
        <div class="mo-footer">

        </div>
    </div>
<script>
    $('.btn-login').on("click",function () {
            var formData = $('#defaultLoginForm').serialize();
            var email = $('#email').val();
            var password = $('#password').val();

            jQuery.ajax({
                type:"GET",
                // contentType: 'application/json',
                url:"/sign/loginProc",
                // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                data:formData,
                success : function(data) {
                    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                    // TODO

                    if(data.message) {
                        // $('#loginCheckError').removeClass('er');
                        $('#loginCheckError').addClass('error-on');
                        $('#loginCheckError').empty();
                        $('#loginCheckError').html('* ' + data.message);
                    }else{
                        // loginAuth(data.access_token);
                        location.href=data.redirectUrl;
                    }
                },

                complete : function(data) {
                    // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                    // TODO
                },
                error : function(xhr, status, error) {
                    alert("error");
                }
            });
        })
</script>

<%@ include file="/WEB-INF/views/mobile/layout/login-footer.jsp" %>