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

    <asset:stylesheet src="bootstrap.css"/>

    <g:layoutHead/>
</head>

<body>
<div class="wrapper">

    <nav class="nav-main">
        <a class="navbar-brand" href="/#"><asset:image src="logo.svg" alt="PerfectCar Logo" style="width: 80px; height: 80px;"/></a>


        <div class="lista-nav">
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Vehículos</a></li>
            </ul>

            <ul class="der">
                <li><a href="#">Iniciar Sesión</a></li>
                <li><a href="#">Registrarse</a></li>
            </ul>
        </div>
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
