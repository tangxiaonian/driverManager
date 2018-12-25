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
					</div>
			</div>
			<!-- right -->
			<div class="box-right col-md-10">
				<!-- panel 1 -->
				<div class="first active">
					<jsp:include page="/user/main.jsp"/>
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
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="delId" value="${emp.empId}">
                                        </td>
                                        <th scope="row">1</th>
                                        <td>漏斗1</td>
                                        <td>2</td>
                                        <td>节水用的!</td>
                                        <td>不知道</td>
                                        <td>物理</td>
                                        <td class="text-center">
                                            <button
                                                    data-Id="${emp.empId}"
                                                    data-toggle="modal"
                                                    data-target="#empUpdateModal"
                                                    class="editBtn btn btn-primary btn-sm">
                                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                编辑
                                            </button>
                                        </td>
                                    </tr>
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

    <script src="/static/main.js"></script>
    <script src="/static/dept.js"></script>
</body>
</html>