<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="store.Product, store.ProductRepository"%>
<jsp:useBean id="store" class="store.ProductRepository" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음식 등록</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/js/validation.js"></script>
</head>
<body>
    <div class="container py-4">
        <jsp:include page="header.jsp"/>

        <div class="p-5 mb-4 bg-light rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">음식 등록</h1>
                <p class="col-md-8 fs-4">여기에서 새로운 음식을 등록할 수 있습니다.</p>
            </div>
            <a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
        </div>

        <div class="row align-items-md-stretch">
            <form name="newFood" action="processAddFood.jsp" method="post" enctype="multipart/form-data" class="col-md-12">
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">음식 코드</label>
                    <div class="col-sm-3">
                        <input type="text" id="foodID" name="foodID" class="form-control">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">음식 이름</label>
                    <div class="col-sm-3">
                        <input type="text" id="name" name="name" class="form-control">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">가격</label>
                    <div class="col-sm-3">
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">원산지</label>
                    <div class="col-sm-3">
                        <input type="text" name="coo" class="form-control">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">칼로리</label>
                    <div class="col-sm-3">
                        <input type="text" id="cal" name="cal" class="form-control">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">상세 설명</label>
                    <div class="col-sm-5">
                        <textarea name="description" id="description" cols="50" rows="2" class="form-control" placeholder="상세 설명을 입력해주세요."></textarea>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">음식 종류</label>
                    <div class="col-sm-3">
                        <select name="foodType" class="form-control">
                            <option value="general">일반음식</option>
                            <option value="seasonal">계절음식</option>
                            <option value="other">기타</option>
                        </select>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">음식 이미지</label>
                    <div class="col-sm-3">
                        <input type="file" name="file" class="form-control">
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddFood()">
                    </div>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>