<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <meta charset="utf-8"/>
    <script type="text/javascript" src="./../static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./../static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="./../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./../static/main_admin.css">
    <link rel="stylesheet" type="text/css" href="./../static/user_main.css">
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        html {
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
<div class="box container">
    <div class="row">
        <!-- left -->
        <div class="pull-left col-md-2">
            <div class="list-group">
                <a href="#" data-index="0" class="list-group-item active">操作选项</a>
                <a href="#" data-index="1" class="list-group-item">Query</a>
                <a href="#" data-index="2" class="list-group-item">我的借用审核</a>
                <a href="#" data-index="3" class="list-group-item">设备归还</a>
            </div>
        </div>
        <!-- panel1 借用-->
        <div class="box-left col-md-10 panel_display">
            <div class="content">
                <div class="header">
                    <h3>试验设备信息查询</h3>
                </div>
                <div class="div-form">
                    <form id="query_form" class="form-inline">
                        <div class="form-group">
                            <label for="d_id">设备ID:</label>
                            <input id="d_id" class="form-control" type="text" name="d_id" placeholder="设备id">
                            <button id="query_Btn" type="button" class="btn btn-default">查询</button>
                        </div>
                    </form>
                </div>
                <div class="tab-content">
                    <table id="firstTable" class="table table-bordered">
                        <caption>试验设备信息</caption>
                        <thead>
                            <tr class="text-center">
                            <th>id</th>
                            <th>设备名称</th>
                            <th>库存数量</th>
                            <th>设备介绍</th>
                            <th>使用方式</th>
                            <th>类别</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="firstTbody">

                        </tbody>
                    </table>
                </div>
                <!-- 显示分页信息 -->
                <div class="row">
                    <!-- 分页条信息 -->
                    <div class="col-md-6">当前<span id="firstCurrentPage">n</span>页,
                        总<span id="firstCountPage">n</span>页,
                        总<span id="firstCount">n</span>条记录
                    </div>
                    <div class="col-md-6">
                        <nav aria-label="Page navigation">
                            <ul class="pagination" id="firstPagination">
                                <li>
                                    <a id="firstPrevious" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li>
                                    <a onclick="pageNum(firstPageForm,2)" href="#">1</a>
                                </li>
                                <li>
                                    <a href="#" id="firstNext" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <%--分页表单--%>
                <form id="firstPageForm" action="">
                    <%--每页的大小--%>
                    <input type="text" hidden name="pageSize" value="5">
                    <%--当前所在的页--%>
                    <input type="text" hidden name="currentPage" value="1">
                </form>
            </div>
        </div>
        <!-- panel2 借用待审核-->
        <div class="box-left col-md-10 panel_hidden">
            <div class="content">
                <div class="header">
                    <h3>待审核通过的设备</h3>
                </div>
                <div class="tab-content">
                    <table id="secondTable" class="table table-bordered">
                        <caption>设备信息</caption>
                        <thead>
                        <tr class="text-center">
                            <th>id</th>
                            <th>设备名称</th>
                            <th>借用数量</th>
                            <th>设备介绍</th>
                            <th>使用方式</th>
                            <th>状态</th>
                            <th>管理员留言</th>
                        </tr>
                        </thead>
                        <tbody id="secondTbody">
                            <tr>
                                <th scope="row">1</th>
                                <td>漏斗1</td>
                                <td>2</td>
                                <td>节水用的!</td>
                                <td>不知道</td>
                                <td>
                                    <span class="fail_status">审核中</span>
                                </td>
                                <th>就是不借给你!</th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- panel3 设备归还-->
        <div class="box-left col-md-10 panel_hidden">
            <div class="content">
                <div class="header">
                    <h3>以借阅设备</h3>
                </div>
                <div class="tab-content">
                    <table id="ThirdTable" class="table table-bordered">
                        <caption>试验设备信息</caption>
                        <thead>
                        <tr class="text-center">
                            <th>id</th>
                            <th>设备名称</th>
                            <th>数量</th>
                            <th>设备介绍</th>
                            <th>使用方式</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="ThirdTbody">
                            <tr>
                                <th scope="row">1</th>
                                <td>漏斗1</td>
                                <td>2</td>
                                <td>节水用的!</td>
                                <td>不知道</td>
                                <td>
                                    <button
                                            data-Id="${emp.empId}"
                                            data-toggle="modal"
                                            data-target="#empUpdateModal"
                                            class="editBtn btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        归还
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 借阅设备的模态框 -->
    <div class="modal fade" id="borrowDriverPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">设备借用信息</h4>
            </div>
            <div class="modal-body">
                <form id="userBorrowDriver" class="form-horizontal">
                    <input hidden type="text" name="d_id" id="driver_id">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">个数</label>
                        <div class="col-sm-10">
                            <input type="text" name="number" class="form-control" id="number"
                                   placeholder="number">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">留言</label>
                        <div class="col-sm-10">
                                <textarea class="form-control" placeholder="留言" id="user_message" name="user_message"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="borrow_Save_Btn">保存</button>
            </div>
        </div>
    </div>
</div>
    <script defer src="./../static/User.js"></script>
</body>
</html>
