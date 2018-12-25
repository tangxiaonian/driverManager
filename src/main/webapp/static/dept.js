//获取部门信息
let add_getDept = document.getElementById("add_getDept");
//如果是admin  添加按钮存在的情况下  注册事件
if (add_getDept){

    add_getDept.onclick = function () {
        //获取部门信息
        getDept(selectAddDepts,1);

    };
}

//显示指定的driver信息
function displayDriver(id) {
    //用户id

    getDriver(id).then((res)=>{

        if (res){

            getDept(selectEditDepts,res.dId);
            driverId.value = id;
            driverNameE.value = res.driverName;
            driverNumberE.value = res.driverNumber;
            driverDescE.value = res.driverDesc;
            driverWayE.value = res.driverWay;
        }
    });

};
//获取id 获取 Driver信息
function getDriver(id) {

    return new Promise((res,rej)=>{
        $.ajax({
            type:"get",
            url:"/driver/"+id,
            success: res
        });
    });

}
// 得到部门信息
function getDept(element,id) {
    $.ajax({
        type:"get",
        url:"/dept",
        success(res){

            element.innerHTML = "";

            res.forEach((item)=>{

                let option = new Option(item.deptName,item.deptId, false,item.deptId === id);

                element.add(option);

            });
        }
    });
}
