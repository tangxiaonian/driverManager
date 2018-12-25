<!-- 员工修改的模态框 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">设备修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="editform">

                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">设备id</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" id="driverId"
                                   placeholder="driverName">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">设备名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="driverName" class="form-control" id="driverNameE"
                                   placeholder="driverName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">库存个数</label>
                        <div class="col-sm-10">
                            <input type="text" name="driverNumber" class="form-control" id="driverNumberE"
                                   placeholder="number">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">设备介绍</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" placeholder="driverDesc" id="driverDescE" name="driverDesc">

                            </textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">使用方式</label>
                        <div class="col-sm-10">
                            <input type="text" name="driverWay" class="form-control" id="driverWayE"
                                   placeholder="driverWay">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">类别选择</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" id="selectEditDepts" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="driver_Update_Btn">更新</button>
            </div>
        </div>
    </div>
</div>
