<!DOCTYPE html>
<%
    def fotoCount = vehiculo?.fotos?.size() ?: 0
%>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
        }

        .nav {
            background-color: #151018;
            padding: 1rem 2rem;
        }

        .nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
            padding: 0;
            margin: 0;
        }

        .nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .nav a:hover {
            text-decoration: underline;
        }

        .scaffold-create {
            max-width: 700px;
            margin: 4rem auto;
            background-color: white;
            padding: 2rem 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        .scaffold-create h1 {
            font-size: 2.2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 2rem;
            color: #151018;
        }

        .form .fieldcontain {
            margin-bottom: 1.5rem;
        }

        .form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #151018;
        }

        .form input,
        .form select,
        .form textarea {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            font-size: 1rem;
            background-color: #f9f9f9;
            transition: border 0.3s ease;
        }

        .form input:focus,
        .form select:focus,
        .form textarea:focus {
            border-color: #151018;
            outline: none;
        }

        .buttons {
            text-align: center;
            margin-top: 2rem;
        }

        .save {
            background-color: #151018;
            color: white;
            padding: 0.9rem 2.5rem;
            font-size: 1.1rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .save:hover {
            background-color: #292030;
        }

        .message {
            background-color: #e0f7fa;
            color: #004d40;
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
        }

        .errors {
            background-color: #ffcdd2;
            color: #b71c1c;
            padding: 1rem;
            border-radius: 0.5rem;
            list-style: none;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            font-weight: bold;
            display: block;
        }
        input {
            padding: 0.5rem;
            width: 100%;
        }
        </style>
    </head>
    <body>
    <h1>Crear Vehículo</h1>

    <g:hasErrors bean="${vehiculo}">
        <ul class="errors" role="alert">
            <g:eachError bean="${vehiculo}" var="error">
                <li><g:message error="${error}" /></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form controller="vehiculo" action="save" method="POST">
        <div class="form-group">
            <label for="marca">Marca</label>
            <g:textField name="marca" value="${vehiculo?.marca}" required=""/>
        </div>

        <div class="form-group">
            <label for="modelo">Modelo</label>
            <g:textField name="modelo" value="${vehiculo?.modelo}" required=""/>
        </div>

        <div class="form-group">
            <label for="anio">Año</label>
            <g:textField name="anio" value="${vehiculo?.anio}" pattern="\\d{4}" required=""/>
        </div>

        <div class="form-group">
            <label for="color">Color</label>
            <g:textField name="color" value="${vehiculo?.color}" required=""/>
        </div>

        <div class="form-group">
            <label for="placa">Placa</label>
            <g:textField name="placa" value="${vehiculo?.placa}" required=""/>
        </div>

        <div class="form-group">
            <label for="precio">Precio</label>
            <g:field type="number" name="precio" value="${vehiculo?.precio}" step="0.01" min="0" required=""/>
        </div>

        <!-- Sección para fotos -->
        <div class="form-group" id="fotos-container">
            <label>Fotos del Vehículo (URLs)</label>
            <input type="text" name="fotos[0].url" placeholder="URL de la foto 1" required />
        </div>
        <button type="button" onclick="addFotoInput()">Agregar otra foto</button>

        <br/><br/>
        <g:submitButton name="create" value="Guardar Vehículo"/>
    </g:form>

    <script>
        var fotoCount = ${fotoCount};

        function agregarCampoFoto() {
            var container = document.getElementById('fotosContainer');

            var input = document.createElement('input');
            input.setAttribute('type', 'text');
            input.setAttribute('name', 'fotos[' + fotoCount + '].url');
            input.setAttribute('placeholder', 'URL de la foto ' + (fotoCount + 1));
            input.required = true;

            container.appendChild(document.createElement('br'));
            container.appendChild(input);

            fotoCount++;
        }
    </script>
    </body>
</html>
