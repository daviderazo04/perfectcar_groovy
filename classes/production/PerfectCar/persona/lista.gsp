<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>LISTA</title>
</head>
<body>
<h1>Registro de Personas</h1>
LISTA
<div class="btn btn-info">
    <g:link controller="persona" action="forma">Registro de personas</g:link>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-error" style="display: block; background-color: #fdd">
        ${flash.message}
    </div>
</g:if>

<table border="1">
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Sexo</th>
        <th>Usuario</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="persona" in="${personas}">
        <tr>
            <td>
                <g:link controller="persona" action="forma" id="${persona.id}">
                    ${persona.nombre}
                </g:link>
            </td>
            <td>${persona.nombre}</td>
            <td>${persona.apellido}</td>
            <td>${persona.sexo}</td>
            <td>${persona.login}</td>
        </tr>
    </g:each>
    </tbody>
</table>

</body>
</html>
