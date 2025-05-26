<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'fotoVehiculo.label', default: 'Foto del Vehículo')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <style>
    .card {
        background: #fff;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        max-width: 600px;
        margin: 2rem auto;
    }
    .card h1 {
        font-size: 1.8rem;
        margin-bottom: 1rem;
        text-align: center;
        color: #2c3e50;
    }
    .form-group {
        margin-bottom: 1.5rem;
    }
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 0.5rem;
        color: #34495e;
    }
    input[type="text"],
    input[type="url"],
    input[type="file"],
    select {
        width: 100%;
        padding: 0.7rem;
        border: 1px solid #ccc;
        border-radius: 6px;
    }
    .message {
        background-color: #e1f5fe;
        border-left: 6px solid #0288d1;
        padding: 1rem;
        margin-bottom: 1rem;
        border-radius: 8px;
    }
    .errors {
        background: #fdecea;
        border-left: 6px solid #d32f2f;
        padding: 1rem;
        margin-bottom: 1rem;
        border-radius: 8px;
        color: #c0392b;
    }
    .errors li {
        margin-left: 1rem;
    }
    .btn-primary {
        background-color: #3498db;
        border: none;
        color: white;
        padding: 0.8rem 1.5rem;
        border-radius: 6px;
        cursor: pointer;
    }
    .btn-primary:hover {
        background-color: #2980b9;
    }
    .nav ul {
        list-style: none;
        padding: 0;
        display: flex;
        gap: 1rem;
        margin-bottom: 2rem;
    }
    .nav a {
        color: #2980b9;
        text-decoration: none;
    }
    </style>
</head>
<body>

<div id="create-fotoVehiculo" class="card content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${this.fotoVehiculo}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.fotoVehiculo}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}"/>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form resource="${this.fotoVehiculo}" method="POST">
        <fieldset class="form">
            <!-- Puedes personalizar los campos aquí en lugar de usar f:all -->
            <div class="form-group">
                <label for="vehiculo"><g:message code="fotoVehiculo.vehiculo.label" default="Vehículo"/></label>
                <g:select name="vehiculo.id" from="${vehiculos}" optionKey="id" optionValue="modelo" value="${fotoVehiculo?.vehiculo?.id}" required=""/>
            </div>

            <div class="form-group">
                <label for="url"><g:message code="fotoVehiculo.url.label" default="URL de la foto"/></label>
                <g:textField name="url" value="${fotoVehiculo?.url}" required=""/>
            </div>
        </fieldset>

        <fieldset class="buttons">
            <g:submitButton name="create" class="btn-primary" value="${message(code: 'default.button.create.label', default: 'Crear')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
