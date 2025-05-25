<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Persona</title>
</head>
<body>
<h1>Registro de Personas</h1>

<g:if test="${flash.message}">
    <div class="alert alert-error" style="display: block; background-color: #fdd">
        ${flash.message}
    </div>
</g:if>

<g:form class="form-horizontal" name="frmPersona" role="form" controller="persona" action="guardar" method="POST">
    <div class="row">
        <input type="hidden" name="id" value="${persona?.id}">
        <div class="form-group col-md-2">
            <label for="nombre" class="col-form-label">Nombre:</label>
        </div>
        <div class="form-group col-md-4">
            <input type="text" class="form-control" name="nombre" id="nombre" value="${persona?.nombre}" />
        </div>
        <div class="form-group col-md-2">
            <label for="apellido" class="col-form-label">Apellido:</label>
        </div>
        <div class="form-group col-md-4">
            <input type="text" class="form-control" name="apellido" id="apellido" value="${persona?.apellido}" />
        </div>
    </div>

    <div class="row mt-3">
        <div class="form-group col-md-1">
            <label for="sexo" class="col-form-label">Sexo:</label>
        </div>
        <div class="form-group col-md-1">
            <input type="text" class="form-control" name="sexo" id="sexo" value="${persona?.sexo}" />
        </div>
        <div class="form-group col-md-2">
            <label for="login" class="col-form-label">Usuario:</label>
        </div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" name="login" id="login" value="${persona?.login}" />
        </div>
        <div class="form-group col-md-2">
            <label for="password" class="col-form-label">Contraseña:</label>
        </div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" name="password" id="password" value="${persona?.password}" />
        </div>

    </div>

    <div class="modal-footer mt-4">
        <button
                type="button" class="btn btn-danger" id="btnEliminar">Eliminar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Aceptar</button>
    </div>
</g:form>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        console.log('Documento cargado');

        const btnEliminar = document.getElementById('btnEliminar');

        // Click simple
        btnEliminar.addEventListener('click', function () {
            alert("click");
            console.log("Se hizo click en el boton de eliminar")
        });

    });
</script>

</html>
