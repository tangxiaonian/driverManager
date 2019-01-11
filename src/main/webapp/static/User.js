//获取左边的列表
let listGroup = document.querySelector(".list-group");
//右边的panel
let aPanel = document.querySelectorAll(".box-left");
let after = 0;

query_Btn.onclick = (event) => {

    let value = query_form["d_id"].value;

    if (!value.trim().length) {
        page(firstPageForm, firstTableHandler);
    } else {
        new Promise((res, rej) => {

            $.ajax({
                type: "get",
                url: "/driver/" + value,
                success: res
            });

        }).then((res) => {

            firstTbody.innerHTML = "";

            let template = `<tr>
                <th scope="row">${res.id}</th>
                <td>${res.driverName}</td>
                <td>${res.driverNumber}</td>
                <td>${res.driverDesc}</td>
                <td>${res.driverWay}</td>
                <td>${res.department.deptName}</td>
                <td>
                    <button data-Id="${res.id}"
                            data-toggle="modal"
                            data-target="#borrowDriver"
                            class="editBtn btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        借用
                    </button>
                </td>
            </tr>`;

            firstTbody.innerHTML = template;
        });
    }

};
// 设备借用
borrow_Save_Btn.onclick = (event) => {

    let diverNumber = document.getElementById("Driver"+driver_id.value);

    console.log(diverNumber);

    if(Number(number.value) > Number(diverNumber.innerHTML)){
        alert("非法操作!");
    }else {

        fetch("/debit", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: $(userBorrowDriver).serialize()
        }).then((response) => {
            response.json().then((result) => {

                alert(result.msg);

                userBorrowDriver.reset();

                $('#borrowDriverPanel').modal('hide');

                page(firstPageForm, firstTableHandler);

            })
        });

    }

}

function setCommintDriverId(id) {
    driver_id.value = id;
}

//设备归还                  借用记录的id 设备id,  归还的数量
function returnDriverStart(id,dId,number){

    fetch("/user/debit",{
        method:"post",
        headers:{
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body:"id="+id+"&dId="+dId+"&number="+number
    }).then((response)=>{
       response.json().then((result)=>{
           alert(result.msg);
           driver_Return(2);
       });
    });

}

//设备归还  先查询出是自己的设备
function driver_Return(flage) {

    fetch("/admin/debits/" + flage, {
        method: "get"
    }).then((response) => {

        response.json().then((resultArray) => {

            console.log(resultArray);

            ThirdTbody.innerHTML = "";

            let template = "";

            resultArray.forEach((item) => {

                let temp = `<tr>
                                <th scope="row">${item.id}</th>
                                <td>${item.driver.driverName}</td>
                                <td>${item.number}</td>
                                <td>${item.driver.driverDesc}</td>
                                <td>${item.driver.driverWay}</td>
                                <td>
                                    <button
                                            data-Id="${item.d_id}"
                                            onclick="returnDriverStart(${item.id},${item.d_id},${item.number})"
                                            data-toggle="modal"
                                            data-target="#empUpdateModal"
                                            class="editBtn btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        归还
                                    </button>
                                </td>
                            </tr>`;

                template += temp;
            });
            ThirdTbody.innerHTML = template;
        });

    });
}

//事件监听
listGroup.addEventListener("click", (event) => {

    let index = event.target.dataset.index - 0;

    let panel = aPanel[index - 1];

    if (panel) {

        aPanel[after].classList.remove("panel_display");
        aPanel[after].classList.add("panel_hidden");

        panel.classList.remove("panel_hidden");
        panel.classList.add("panel_display");

        after = index - 1;

        //页面刷新
        switch (after) {
            case 0 :
                page(firstPageForm, firstTableHandler);
                break;
            case 1:
                borrowRecordDisplay();
                break;
            case 2:
                driver_Return(2);
                break;
        }
    }
});

// 借用记录的显示
function borrowRecordDisplay() {

    fetch("/user/debits", {
        method: "get"
    }).then((response) => {
        response.json().then(borrowRecord);
    });

}

// 借用审核
function borrowRecord(resArray) {

    secondTbody.innerHTML = "";

    let template = "";

    resArray.forEach((item) => {

        let className = item.flageStatus == 0 ? "succ_status" : item.flageStatus == 1 ? "fail_status" : "succ_status";
        // 0:审核中，，1审核失败 2审核成功
        let temp = `<tr>
                        <th scope="row">${item.d_id}</th>
                        <td>${item.driver.driverName}</td>
                        <td>${item.number}</td>
                        <td>${item.driver.driverDesc}</td>
                        <td>${item.driver.driverWay}</td>
                        <td>
                            <span class="${className}">
                                ${item.flageStatus == 0 ? "审核中" : item.flageStatus == 1 ? "失败" : "成功"}
                            </span>
                        </td>
                        <th>${item.admin_message ? item.admin_message : "暂无"}</th>
                    </tr>`;
        template += temp;
    });
    secondTbody.innerHTML = template;

    console.log(resArray);
}


//页面进入触发刷新
page(firstPageForm, firstTableHandler);

//请求分页查询
function page(pageForm, fn) {

    fetch("/drivers?" + $(pageForm).serialize(), {}).then(fn);
}

//
function pageNum(pageForm, currentPage) {
    //获取form
    pageForm["currentPage"].value = currentPage;
    page(pageForm, firstTableHandler);
}

//处理第几个页面的表格数据的显示
function firstTableHandler(response) {

    response.json().then((res) => {

        let template = "";

        res.list.forEach((item) => {

            let temp = `<tr>
                <th scope="row">${item.id}</th>
                <td>${item.driverName}</td>
                <td id="Driver${item.id}">${item.driverNumber}</td>
                <td>${item.driverDesc}</td>
                <td>${item.driverWay}</td>
                <td>${item.department.deptName}</td>
                `;
            let text = `<td>
                    <button data-Id="${item.id}"
                    
                    onclick="setCommintDriverId(${item.id})"
                            data-toggle="modal"
                            data-target="#borrowDriverPanel"
                            class="editBtn btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        借用
                    </button>
                </td>
            </tr>`;
            if (item.driverNumber <= 0){

                text = `<td>
                        <button data-Id="${item.id}"
                            disabled
                            onclick="setCommintDriverId(${item.id})"
                            data-toggle="modal"
                            data-target="#borrowDriverPanel"
                            class="editBtn btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            借用
                        </button>
                    </td>
                </tr>`
            }

            temp += text;
            template += temp;
        });

        firstTbody.innerHTML = template;
        firstCurrentPage.innerHTML = res.currentPage;
        firstCountPage.innerHTML = res.countPage;
        firstCount.innerHTML = res.count;

        // console.log(res);
        pageNumber(firstPagination, "first", "firstPageForm", res.pageSize, res.countPage, res.currentPage);

        //前一页
        firstPrevious.onclick = () => {

            previous(firstPageForm);

        };
        //后一页
        firstNext.onclick = () => {

            next(firstPageForm, res.countPage);

        };

    });
}

//                 那个页面的导航条  页面导航条的id  页面的那个表单
function pageNumber(pagination, pagePaginationID, pageForm, pageSize, pageCount, currentPage) {

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

    for (let i = pageStart; i <= pageEnd; i++) {
        let temp = `<li>
                        <a onclick="pageNum(${pageForm},${i})" href="#">${i}</a>
                    </li>`;
        template += temp;
    }
    template += next;

    pagination.innerHTML = template;
}

//前一页
function previous(pageForm) {

    let currentPage = pageForm["currentPage"].value - 0 - 1;
    let pageSize = pageForm["pageSize"].value;

    if (currentPage <= 0)
        currentPage = 1;

    pageForm["currentPage"].value = currentPage;

    page(pageForm, firstTableHandler);
}

//后一页
function next(pageForm, count) {

    let currentPage = pageForm["currentPage"].value - 0 + 1;
    let pageSize = pageForm["pageSize"].value;

    if (currentPage > count)
        currentPage = count;

    pageForm["currentPage"].value = currentPage;

    page(pageForm, firstTableHandler);
}