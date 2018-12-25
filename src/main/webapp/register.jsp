<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>register</title>
	<meta charset="utf-8"/>
    <script type="text/javascript" src="./static/js/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="./static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./static/login.css">
</head>
<body>
    <div id="content">
    	<div class="container" style="padding-left:0px;padding-right:0px;">
            <div id="form-title">实验设备管理系统</div>
            <form id="register_form">
                <div id="form-content">
                    <div id="form-msg">注册账号</div>
                    <div id="form-inputs">
                    	<div class="form-input">
                            <i class="iconfont"></i>
                            <input placeholder="用户名" name="username" type="text" id="username">
                            <div class="err_msg" id="pwd_err"></div>
                        </div>
                        
                        <div class="form-input">
                            <i class="iconfont"></i>
                            <!-- 手机号: -->
                            <input placeholder="手机号" name="phone" type="text" id="phone" 
                            value="" autocomplete="false">
                        </div>
                        
                        <div class="form-input">
                            <i class="iconfont"></i>
                            <input placeholder="密码" type="password" name="password" id="pwd" autocomplete="new-password">
                            <div class="err_msg" id="pwd_err"></div>
                        </div>

                        <div class="form-input">
                            <i class="iconfont"></i>
                            <input placeholder="再次确定密码" type="password" id="rpwd" autocomplete="new-password">
                        </div>
                        <div class="form-submit">
                            <button type="button" class="btn btn-primary" id="submitBtn" onclick="registerCommit()">立即注册</button>
                        </div>
                    </div>
                    <div class="form-foot">
                        <span>已有账户，<a href="./login.jsp">立即登录</a></span>
                    </div>  
                </div>
            </form>
        </div>
    </div>

    <script>

       function registerCommit() {

           fetch("/register",{

               method: "POST",

               headers:{
                   "Content-Type": "application/x-www-form-urlencoded"
               },

               body:$(register_form).serialize()

           }).then(goLogin).catch((err)=>{

              console.log(err);

           });
       }

       function goLogin(response) {

           response.json().then((res)=>{

               window.alert(res.msg);

               if (res.flage){

                   window.location.href = "/";
               }

           });
       }

    </script>

</body>
</html>