<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Formulario Persona</title>
    <style>
    .content {

        padding: 2rem;
    }
    h1 {
        text-align: center;
        margin-bottom: 2rem;
        color: #2c3e50;
    }
    .form-section {
        max-width: 900px;
        margin: 0 auto;
        background-color: #f9f9f9;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    }
    .form-group {
        margin-bottom: 1.5rem;
    }
    label {
        font-weight: 600;
        margin-bottom: 0.5rem;
        display: block;
    }
    .form-control {
        width: 100%;
        padding: 0.6rem 0.9rem;
        border: 1px solid #ccc;
        border-radius: 8px;
    }
    .message-flash {
        background-color: #fdecea;
        color: #c0392b;
        padding: 1rem;
        border-left: 6px solid #c0392b;
        border-radius: 8px;
        margin-bottom: 1.5rem;
        max-width: 900px;
        margin-left: auto;
        margin-right: auto;
    }
    .form-actions {
        display: flex;
        justify-content: flex-end;
        gap: 1rem;
        margin-top: 2rem;
    }
    .btn {
        padding: 0.6rem 1.4rem;
        border: none;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
    }
    .btn-danger {
        background-color: #e74c3c;
        color: white;
    }
    .btn-secondary {
        background-color: #bdc3c7;
        color: white;
    }
    .btn-primary {
        background-color: #3498db;
        color: white;
    }
    .btn:hover {
        opacity: 0.9;
    }
    </style>
</head>
<body>

<h1>Registro de Personas</h1>

<g:if test="${flash.message}">
    <div class="message-flash">${flash.message}</div>
</g:if>

<div class="form-section">
    <g:form name="frmPersona" role="form" controller="persona" action="guardar" method="POST">
        <input type="hidden" name="id" value="${persona?.id}" />

        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre" value="${persona?.nombre}" />
        </div>

        <div class="form-group">
            <label for="apellido">Apellido</label>
            <input type="text" class="form-control" name="apellido" id="apellido" value="${persona?.apellido}" />
        </div>

        <div class="form-group">
            <label for="sexo">Sexo</label>
            <input type="text" class="form-control" name="sexo" id="sexo" value="${persona?.sexo}" />
        </div>

        <div class="form-group">
            <label for="login">Usuario</label>
            <input type="text" class="form-control" name="login" id="login" value="${persona?.login}" />
        </div>

        <div class="form-group">
            <label for="password">Contraseña</label>
            <input type="text" class="form-control" name="password" id="password" value="${persona?.password}" />
        </div>

        <div class="form-actions">
            <button type="button" class="btn btn-danger" id="btnEliminar">Eliminar</button>
            <button type="reset" class="btn btn-secondary">Cancelar</button>
            <button type="submit" class="btn btn-primary">Aceptar</button>
        </div>
    </g:form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const btnEliminar = document.getElementById('btnEliminar');

        btnEliminar.addEventListener('click', function () {
            if (confirm("¿Estás seguro de que deseas eliminar esta persona?")) {
                // Aquí podrías redirigir a un controlador para eliminar por ID
                alert("Función de eliminación no implementada.");
            }
        });
    });
</script>

</body>
</html>
