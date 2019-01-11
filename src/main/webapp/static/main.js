//获取左边的列表
let listGroup = document.querySelector(".list-group");
//右边的panel
let aPanel = document.querySelector(".box-right").children;
let after = 0;
//要提交的表单列表
let formArray = [firstPageForm, secondPageForm];

query_Btn.onclick = (event) => {

    let value = query_form["d_id"].value;

    if(!value.trim().length){
        page(formArray[0], firstTableHandler);
    }else {
        new Promise((res,rej)=>{

            $.ajax({
                type:"get",
                url:"/driver/"+value,
                success: res
            });

        }).then((res)=>{

            firstTbody.innerHTML = "";

            let template = `<tr>
                <th scope="row">${res.id}</th>
                <td>${res.driverName}</td>
                <td>${res.driverNumber}</td>
                <td>${res.driverDesc}</td>
                <td>${res.driverWay}</td>
                <td>${res.department.deptName}</td>
            </tr>`;

            firstTbody.innerHTML = template;
        });
    }

};

//  借用记录的id    审核结果的标志flage  1:不可借  2:可借   设备id   借用的数量
function setCommintRecordId(id,resultFlage,d_idN,numberN){

    recordId.value = id;

    flage.value = resultFlage;

    driverId_.value = d_idN;

    number.value = numberN;
}

//管理员审核回复
Reply_Btn.addEventListener("click",function (event) {

    fetch("/admin/debit/",{
        method:"post",
        headers:{
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body:$(resultForm).serialize()
    }).then((response)=>{

        response.json().then((result)=>{
            alert(result.msg);

            resultForm.reset();

            $('#checkDriver').modal('hide');

            checkDriver(0);
        });
    });

});

//事件监听
listGroup.addEventListener("click", (event) => {

    let index = event.target.dataset.index - 0;

    let panel = aPanel[index - 1];

    if (panel) {

        aPanel[after].classList.remove("active");

        panel.classList.add("active");

        after = index - 1;

        //页面刷新
        switch (after) {
            case 0 :
                page(formArray[0], firstTableHandler);
                break;
            case 1 :
                page(formArray[1], secondTableHandler);
                break;
            case 2 :
                checkDriver(0);
                break;
        }
    }
});

//显示需要审核的设备列表
function checkDriver(flage){

    fetch("/admin/debits/"+flage,{
        method:"get"
    }).then((response)=>{
       response.json().then((resultArray)=>{

           console.log(resultArray);

           ThirdTbody.innerHTML = "";

           let template = "";
           resultArray.forEach((item)=>{

              let temp = `<tr>
                            <th scope="row">${item.d_id}</th>
                            <td>${item.user.username}</td>
                            <td>${item.driver.driverName}</td>
                            <td>${item.number}</td>
                            <td>${item.user_message}</td>
                            <td>
                                <button
                                        data-Id="${item.id}"
                                        onclick="setCommintRecordId(${item.id},2,${item.d_id},${item.number})"
                                        data-toggle="modal"
                                        data-target="#checkDriver"
                                        class="editBtn btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    可借
                                </button>
                                <button
                                        data-Id="${item.id}"
                                        onclick="setCommintRecordId(${item.id},1,${item.d_id},${item.number})"
                                        data-toggle="modal"
                                        data-target="#checkDriver"
                                        class="editBtn btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    不可借
                                </button>
                            </td>
                        </tr>`;
               template += temp;
           });

           ThirdTbody.innerHTML = template;
       });
    });

}

//页面进入触发刷新
page(formArray[0], firstTableHandler);

//add员工信息
let driver_Save_Btn = document.getElementById("driver_Save_Btn");

if (driver_Save_Btn){

    driver_Save_Btn.onclick = function(){

        $.ajax({
            type:"POST",
            url:"/driver",
            data: $("#addform").serialize()+"&_method=PUT",
            success(res){
                if (res){
                    window.alert(`${res.msg}`);
                }
                // 表单清空
                addform.reset();
                $('#empAddModal').modal('hide');
                //    页面刷新
                page(formArray[1], secondTableHandler)
            }
        });
    };
}

//driver_Update_Btn
let driver_Update_Btn = document.getElementById("driver_Update_Btn");
if (driver_Update_Btn) {

    driver_Update_Btn.onclick = function(){

        $.ajax({
            type:"POST",
            url:"/post_driver",
            data: $("#editform").serialize(),
            success(res){
                if (res){
                    window.alert(`${res.msg}`);
                }
                $('#empUpdateModal').modal('hide');
                //    页面刷新
                page(formArray[1], secondTableHandler);
            }
        });
    };
}

//delDriver
let delDriver = document.getElementById("delDriver");
if (delDriver) {

    delDriver.onclick = function(){

        let checks = document.querySelectorAll("tbody td input[type=checkbox]");
        let delA = [];

        checks.forEach((item)=>{

            if(item.checked)

                delA.push(item.value);
        });
        if (delA.length){

            fetch("/delDrivers",{

                method:"post",
                headers:{
                    "Content-Type":"application/x-www-form-urlencoded"
                },
                body: "delA="+delA+"&_method=DELETE"

            }).then((response)=>{

               response.json().then((res)=>{
                  alert(res.msg);
               });
                //    页面刷新
                page(formArray[1], secondTableHandler);

            });
        }

    };
}


//请求分页查询
function page(pageForm, fn) {

    fetch("/drivers?"+$(pageForm).serialize(),{

    }).then(fn);
}

//
function pageNum(pageForm, currentPage) {
    //获取form
    pageForm["currentPage"].value = currentPage;
    page(pageForm, !formArray.indexOf(pageForm) ? firstTableHandler : secondTableHandler);

}

//处理第几个页面的表格数据的显示
function firstTableHandler(response) {

    response.json().then((res)=>{

        let template = "";

        res.list.forEach((item)=>{

            let temp = `<tr>
                <th scope="row">${item.id}</th>
                <td>${item.driverName}</td>
                <td>${item.driverNumber}</td>
                <td>${item.driverDesc}</td>
                <td>${item.driverWay}</td>
                <td>${item.department.deptName}</td>
            </tr>`;

            template += temp;
        });

        firstTbody.innerHTML = template;
        firstCurrentPage.innerHTML = res.currentPage;
        firstCountPage.innerHTML = res.countPage;
        firstCount.innerHTML = res.count;

        // console.log(res);
        pageNumber(firstPagination,"first","firstPageForm",res.pageSize,res.countPage,res.currentPage);

        //前一页
        firstPrevious.onclick = () => {

            previous(formArray[0]);

        };
        //后一页
        firstNext.onclick = () => {

            next(formArray[0],res.countPage);

        };

    });
}
//                 那个页面的导航条  页面导航条的id  页面的那个表单
function pageNumber(pagination,pagePaginationID,pageForm,pageSize,pageCount,currentPage) {

    pagination.innerHTML = "";

    let offsetPage = ~~(pageSize / 2);
    // 左边偏移
    let leftOffsetpage = currentPage - offsetPage;
    // 左边偏移最小值
    let pageStart = leftOffsetpage < 1 ? 1 : leftOffsetpage;
    // 右边偏移
    let rightOffsetPage = currentPage + offsetPage;
    //  右边偏移 - 页的大小 <= 0 为第一页的最大值:偏移页为最大值
    let pageEnd = rightOffsetPage - pageSize <= 0 ? pageSize :
        rightOffsetPage;
    // 右边偏移最大值
    pageEnd = pageEnd > pageCount ? pageCount : pageEnd;
    // 最大开始页数 = 总页数 - 页的大小
    let pageStart_ = pageCount - pageSize + 1;
    // pageStart_ < 当前开始页数 ? 最大开始页数 : 当前开始页数
    pageStart = pageStart_ < pageStart ? pageStart_ : pageStart;


    let previous =
        `<li>
            <a id="${pagePaginationID}Previous" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>`;
    let next =
        `<li>
            <a id="${pagePaginationID}Next" href="#" aria-label="Previous">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>`;
    let template = previous;

    for (let i = pageStart;i <= pageEnd;i++){
        let temp = `<li>
                        <a onclick="pageNum(${pageForm},${i})" href="#">${i}</a>
                    </li>`;
        template += temp;
    }
    template += next;

    pagination.innerHTML = template;
}

function secondTableHandler(response) {

    response.json().then((res)=>{

        let template = "";

        res.list.forEach((item)=>{

            let temp = `<tr>
                <td>
                    <input type="checkbox" name="delId" value="${item.id}">
                </td>
                <th scope="row">${item.id}</th>
                <td>${item.driverName}</td>
                <td>${item.driverNumber}</td>
                <td>${item.driverDesc}</td>
                <td>${item.driverWay}</td>
                <td>${item.department.deptName}</td>
                <td class="text-center">
                    <button
                            data-Id="${item.id}"
                            data-toggle="modal"
                            onclick="displayDriver(${item.id})"
                            data-target="#empUpdateModal"
                            class="editBtn btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                </td>
            </tr>`;

            template += temp;
        });
        secondTbody.innerHTML = template;
        secondCurrentPage.innerHTML = res.currentPage;
        secondCountPage.innerHTML = res.countPage;
        secondCount.innerHTML = res.count;

        pageNumber(secondPagination,"second","secondPageForm",res.pageSize,res.countPage,res.currentPage);

        // 前一页
        secondPrevious.onclick = () => {
            previous(formArray[1]);
        };
        //后一页
        secondNext.onclick = () => {
            next(formArray[1],res.countPage);
        };

    });
}

//前一页
function previous(pageForm) {

    let currentPage = pageForm["currentPage"].value - 0 - 1;
    let pageSize = pageForm["pageSize"].value;

    if (currentPage <= 0)
        currentPage = 1;

    pageForm["currentPage"].value = currentPage;

    page(pageForm, !formArray.indexOf(pageForm) ? firstTableHandler : secondTableHandler);
}

//后一页
function next(pageForm,count) {

    let currentPage = pageForm["currentPage"].value - 0 + 1;
    let pageSize = pageForm["pageSize"].value;

    if (currentPage > count)
        currentPage = count;

    pageForm["currentPage"].value = currentPage;

    page(pageForm, !formArray.indexOf(pageForm) ? firstTableHandler : secondTableHandler);
}