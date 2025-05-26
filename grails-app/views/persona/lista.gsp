<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Personas</title>
    <style>
    .content {
        padding: 2rem;
    }
    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 2rem;
    }
    .top-bar {
        display: flex;
        justify-content: space-between;
        margin-bottom: 1.5rem;
        align-items: center;
    }
    .btn-register {
        background-color: #3498db;
        color: white;
        padding: 0.6rem 1.2rem;
        border: none;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
    }
    .btn-register:hover {
        background-color: #2980b9;
    }
    .message-flash {
        background-color: #e8f5e9;
        color: #2e7d32;
        padding: 1rem;
        border-left: 6px solid #2e7d32;
        border-radius: 8px;
        margin-bottom: 1rem;
    }
    .data-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    .data-table th,
    .data-table td {
        padding: 1rem;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .data-table th {
        background-color: #f4f6f8;
        color: #34495e;
    }
    .data-table tr:hover {
        background-color: #f1f1f1;
    }
    .link-nombre {
        color: #2980b9;
        text-decoration: none;
        font-weight: bold;
    }
    .link-nombre:hover {
        text-decoration: underline;
    }
    </style>
</head>
<body>

<h1>Registro de Personas</h1>

<div class="top-bar">
    <div>
        <strong>Total: ${personas?.size()}</strong>
    </div>
    <g:link controller="persona" action="forma" class="btn-register">
        + Registrar Nueva Persona
    </g:link>
</div>

<g:if test="${flash.message}">
    <div class="message-flash">
        ${flash.message}
    </div>
</g:if>

<table class="data-table">
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
                <g:link controller="persona" action="forma" id="${persona.id}" class="link-nombre">
                    ${persona.nombre}
                </g:link>
            </td>
            <td>${persona.apellido}</td>
            <td>${persona.sexo}</td>
            <td>${persona.login}</td>
        </tr>
    </g:each>
    </tbody>
</table>

</body>
</html>
