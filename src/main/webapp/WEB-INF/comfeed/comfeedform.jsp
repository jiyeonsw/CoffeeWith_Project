<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffeewith</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
<link rel="stylesheet" href="../res/css/style.css" type="text/css">
<style type="text/css">

    table{
        height: 700px;
        width: 500px;
    }

    table .photo{
        width: 70%;
        vertical-align: middle;
        text-align: center;
    }

    table .profile{
        height: 10%;
        vertical-align: middle;
    }

    #preview{

    }


</style>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
    <div>
        <b>새 피드 작성</b>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        <table class="table table-bordered" >
            <tr>
                <td rowspan="4" class="photo">
                    <a><i class='fas fa-photo-video' style='font-size:24px'></i>사진 선택</a>
                    <input class="selectphoto" type="file" multiple="multiple" style="display: none">
                    <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-interval="false">
                        <div class="carousel-inner" id="carousel-inner">

                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </td>
                <td class="profile">
                    <img src="${sessionScope.login_photo}">
                    ${sessionScope.login_nick}
                </td>
            </tr>
            <tr>
                <td>내용</td>
            </tr>
            <tr>
                <td>카페</td>
            </tr>
            <tr>
                <td>태그</td>
            </tr>
        </table>
        <a>공유하기</a>
    </div>
</form>
</body>

<script>
    $(".photo a").click(function (){
        $(".photo .selectphoto").click();
    })

    // $(".selectphoto").on("change",function (event){
    //     var file=event.target.files;
    //     var reader=new FileReader();
    //
    //     for(var f in file){
    //
    //         reader.onload=function (e) {
    //             $(".carousel-inner").add(
    //                 '<div class="carousel-item"></div>'
    //             )
    //             $(".carousel-item").attr("background-image","f");
    //         }
    //         reader.readAsDataURL(f);
    //     }
    // })
    function readMultipleImage(input) {
        const multipleContainer = document.getElementById('multipleContainer')

        if(input.files) {
            const fileArr = Array.from(input.files)
            const $colDiv1 = document.createElement('div')
            const $colDiv2 = document.createElement('div')
            $colDiv1.classList.add('column')
            $colDiv2.classList.add('column')
            fileArr.forEach((file, index) => {
                const reader = new FileReader()
                const $imgDiv = document.createElement('div')
                const $img = document.createElement('img')
                $img.classList.add('image')
                const $label = document.createElement('label')
                $label.classList.add('image-label')
                $label.textContent = file.name
                $imgDiv.appendChild($img)
                $imgDiv.appendChild($label)
                reader.onload = e => {
                    $img.src = e.target.result

                    //$imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
                    //$imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
                }

                console.log(file.name)
                if(index % 2 == 0) {
                    $colDiv1.appendChild($imgDiv)
                } else {
                    $colDiv2.appendChild($imgDiv)
                }

                reader.readAsDataURL(file)
            })
            multipleContainer.appendChild($colDiv1)
            multipleContainer.appendChild($colDiv2)
        }
    }
    // 이벤트 리스너
    document.getElementById('carousel-inner').addEventListener('change', (e) => {
        readMultipleImage(e.target);
    })


</script>
</html>


<%--        <div class="carousel-item">--%>
<%--            <img src="..." class="d-block w-100" alt="...">--%>
<%--        </div>--%>
