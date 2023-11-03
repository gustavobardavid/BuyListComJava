<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Dashboard</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- Custom styles for this template-->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>
<style>
 
@import url('https://fonts.googleapis.com/css2?family=Mulish&display=swap');
.header {
display: flex;
justify-content: center;
text-align: center;
width: 100%;
}
body {
font-size: 13px;
font-weight: 400;
font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
margin: 0;
/* background: linear-gradient(to right, #010e1f, #010e1f); */
background-size: cover;
background-size: cover;
}
.button {
color: #f18324;
cursor: pointer;
font-size: 1rem;
line-height: 2.5rem;
 font-family: monospace;
max-width: 160px; 
width: 100%; 
letter-spacing: 0.3rem;
font-weight: 600;
position: relative;
text-decoration: none;
text-transform: uppercase;
display: flex;
justify-content: center;
transition: all 1s ease-in;
padding: 2px;
}

.button:hover {
color: #FF9950;
text-decoration: none;
}

.button svg {
height: 40px;
left: 0;
top: 0; 
position: absolute;
width: 100%; 
}

.button rect {      
fill: none;
stroke: #f18324;
stroke-width: 2;
stroke-dasharray: 450, 0;
transition: all 0.5s linear;
}

.button:hover rect {
stroke-width: 5;
stroke-dasharray: 20, 300;
stroke-dashoffset: 48;
stroke: #FF9950;
transition: all 2s cubic-bezier(0.22, 1, 0.25, 1);
}
</style>
<body class="">
<hr>
<div class="container">
<div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Lista de Casamento
                    <button onclick="window.print()" class="d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm"></i></button>
                    </h4>
            <div class="table-responsive">
            <table class="table table-bordered" id="dataTable">
              <thead>
                <tr>
                 <th>Descrição</th>
                 <th>Valor</th>
                 <th>Data  da  adição</th>
                 <th>Ações</th>
                </tr>
              </thead>
              <tbody> 
              <c:if test="${not empty itens}">
                    <c:forEach items="${itens}" var="item">
                        <tr>
                            <td>
                            <c:out value="${item.getNome()}" />
                            </td>
                            <td>
                            <c:out value="${item.getPreco()}"/>
                            </td>
                            <td><c:out value="${item.getCreatedFormated()}"></c:out></td>
                                <td>
                                    <a href="<c:url value='${item.getUrl()}'/>">
                                        <button class="d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-eye fa-sm"></i></button>
                                    </a>
                                    <a href="<c:url value='deletar'><c:param name="id" value="${item.id}" /></c:url>">
                                        <button class="d-sm-inline-block btn btn-sm btn-danger shadow-sm"><i class="fas fa-trash fa-sm"></i></button>
                                    </a>
        
                                    </td>
                        </tr>
                    </c:forEach>
                   </c:if>           
              </tbody>
            </table>
          </div>
         </div>
    </div>
</div>
<div class="text-center mt-4">
    <a href="<c:url value='adicionar'/>" class="btn btn-primary">Adicionar</a>
</div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<script src="js/carousel.js"></script>
<script>
document.getElementById("closeButton").addEventListener("click", function () {
    document.getElementById("notification").style.display = "none";
});
</script>
</body>
</html>
