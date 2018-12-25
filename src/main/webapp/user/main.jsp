<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<div id="box" style="padding-top: 0;">
    <div class="content">
        <div class="header">
            <h3>试验设备信息查询</h3>
        </div>
        <div class="div-form">
            <%--查询表单--%>
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
                    <tr>
                        <th>id</th>
                        <th>设备名称</th>
                        <th>库存数量</th>
                        <th>设备介绍</th>
                        <th>使用方式</th>
                        <th>类别</th>
                    </tr>
                </thead>
                <tbody id="firstTbody">
                    <tr>
                        <th scope="row">1</th>
                        <td>漏斗1</td>
                        <td>2</td>
                        <td>节水用的!</td>
                        <td>不知道</td>
                        <td>物理</td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>漏斗1</td>
                        <td>2</td>
                        <td>节水用的!</td>
                        <td>不知道</td>
                        <td>物理</td>
                    </tr>
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