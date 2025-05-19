<!doctype html>
<html lang="es" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="PerfectCar"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Poppins&display=swap" rel="stylesheet">

    <asset:link rel="icon" href="logo.svg" type="image/x-ico"/>

    <asset:stylesheet src="estilos.css"/>

    <g:layoutHead/>
</head>

<body>
<div class="wrapper">

<nav class="nav-main">
    <a class="navbar-brand" href="/#"><asset:image src="logo.svg" alt="PerfectCar Logo" style="width: 80px; height: 80px;"/></a>
    <li class="lista-nav">
        <ul>
            <a href="#">Inicio</a>
        </ul>
        <ul>
            <a href="#">Vehículos</a>
        </ul>
    </li>
</nav>



<div class="content">
    <g:layoutBody/>
</div>

<footer class="footer">
    <div class="footer-section">
        <h3>PerfectCar © 2025 Todos los derechos reservados</h3>
    </div>
</footer>
</div>


<asset:javascript src="application.js"/>

</body>
</html>
