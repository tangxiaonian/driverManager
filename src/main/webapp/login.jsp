
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>login</title>
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
            <form id="submit_form" method="Get">
                <div id="form-content">
                    <div id="form-msg">登录账号</div>
                    <div id="form-inputs">
                        <div class="form-input">
                            <i class="iconfont"></i>
                            <input placeholder="username" name="username" type="text" value="">
                        </div>
                        <div class="form-input">
                            <i class="iconfont"></i>
                            <input placeholder="password" name="password" type="password" id="pwd" >
                            <div class="err_msg" id="pwd_err"></div>
                        </div>
                        <div class="form-submit">
                            <button type="button" class="btn btn-primary" id="submitBtn">立即登录</button>
                        </div>
                    </div>
                    <div class="form-foot">
                        <span>没有账户，<a href="./register.jsp">立即注册</a></span>
                        <span class="customer-forget"><a href="#">忘记密码</a></span>
                    </div>  
                </div>
            </form>
        </div>
    </div>

    <script>
        window.onload = function (ev) {

            function serilizer(data){

                return Object.keys(data).map((item)=>{
                    return item + "=" + data[item];
                }).join("&");

            }

            submitBtn.onclick = function (ev) {


                let data = {
                    username:submit_form["username"].value,
                    password:submit_form["password"].value
                }

                fetch("/login?"+serilizer(data),{

                }).then(goIndex).catch((err)=>{

                    console.log(err);

                });

                function goIndex(response){

                    response.json().then((res)=>{

                        window.alert(res.msg);

                        console.log(res.flage);

                        if (res.flage){
                            window.location.href = res.page;
                        }
                    });
                }
            }
        }
    </script>
</body>
</html>