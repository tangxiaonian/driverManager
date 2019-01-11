<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>后台管理系统</title>
	<meta charset="utf-8"/>
	<script type="text/javascript" src="./../static/js/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./../static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="./../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./../static/main_admin.css">
    <link rel="stylesheet" type="text/css" href="./../static/admin.css">
    <style>
    	*{
    		padding: 0;
    		margin: 0;
    	}
    	html{
    		background-color: #f2f2f2;
    	}
    </style>
</head>
<body>
	<!-- header -->
	<div id="container">
		<div class="container">
			<!-- 导航条 -->
			<nav class="navbar">
			    <div class="container-fluid">
				    <div class="navbar-header">
				      	<a class="navbar-brand" href="#">实验设备管理系统</a>
				    </div>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">${user.username}</a></li>
						<li><a href="/logout">登出</a></li>
					</ul>
			    </div> 
			</nav>
		</div>
	</div>
	<!-- body -->
	<div class="box container">
		<div class="row">
			<!-- left -->
			<div class=" box-left col-md-2">
                <div class="list-group">
                    <a href="#" data-index="0" class="list-group-item active">操作选项</a>
                    <a href="#" data-index="1" class="list-group-item">Query</a>
                    <c:if test="${user.role == 1}">
                        <a href="#" data-index="2" class="list-group-item">CRUD</a>
                    </c:if>
                    <a href="#" data-index="3" class="list-group-item">设备审核</a>
                </div>
			</div>
			<!-- right -->
			<div class="box-right col-md-10">
				<!-- panel 1 -->
				<div class="first active">
					<jsp:include page="/common/main.jsp"/>
				</div>
                <c:if test="${user.role == 1}">
                    <!-- panel 2 -->
                    <div class="second">
                        <div class="page-header">
                            <h1>CRUD<small>CRUD</small></h1>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <a id="delDriver" class="btn btn-default pull-right" href="#" role="button">删除</a>
                                <a data-toggle="modal" id="add_getDept" data-target="#empAddModal" class="btn btn-default pull-right" href="#" role="button">新增</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table id="secondTable" class="table table-hover table-bordered">
                                    <tr>
                                        <th>#</th>
                                        <th>id</th>
                                        <th>设备名称</th>
                                        <th>库存数量</th>
                                        <th>设备介绍</th>
                                        <th>使用方式</th>
                                        <th>类别</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    <tbody id="secondTbody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- 显示分页信息 -->
                        <div class="row">
                            <!-- 分页条信息 -->
                            <div class="col-md-6">当前<span id="secondCurrentPage">n</span>页,
                                总<span id="secondCountPage">n</span>页,
                                总<span id="secondCount">n</span>条记录
                            </div>
                            <div class="col-md-6">
                                <nav aria-label="Page navigation">
                                    <ul id="secondPagination" class="pagination">
                                        <li>
                                            <a id="secondPrevious" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#" id="secondNext" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!-- panel3 -->
                <div class="Third" style="padding:5px;">
                    <div class="page-header">
                        <h3>要审核的记录</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <table id="ThirdTable" class="table table-bordered">
                                <caption>试验设备信息</caption>
                                <thead>
                                <tr class="text-center">
                                    <th>id</th>
                                    <th>设备借用者</th>
                                    <th>设备名</th>
                                    <th>数量</th>
                                    <th>用户留言</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="ThirdTbody">


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</div>
    <%--分页表单--%>
    <form id="secondPageForm" action="">
        <%--每页的大小--%>
        <input type="text" hidden name="pageSize" value="5">
        <%--当前所在的页--%>
        <input type="text" hidden name="currentPage" value="1">
    </form>

    <jsp:include page="/addModel.jsp"/>
    <jsp:include page="/editModal.jsp"/>
    <jsp:include page="checkDriver.jsp"/>

    <script src="/static/main.js"></script>
    <script src="/static/dept.js"></script>
</body>
</html>