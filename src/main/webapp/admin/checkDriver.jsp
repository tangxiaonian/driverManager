<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="checkDriver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">审核信息留言</h4>
            </div>
            <div class="modal-body">
                <form id="resultForm" class="form-horizontal">
                    <%--要修改的记录id--%>
                    <input type="text" name="recordId" id="recordId" value="" hidden>
                        <%--标志--%>
                    <input type="text" name="flage" id="flage" value="" hidden>
                    <%--设备id--%>
                    <input type="text" name="driverId" id="driverId_" value="" hidden>
                    <%--设备数量--%>
                    <input type="text" name="number" id="number" value="" hidden>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">留言</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" placeholder="留言" id="message" name="message"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="Reply_Btn">回复</button>
            </div>
        </div>
    </div>
</div>