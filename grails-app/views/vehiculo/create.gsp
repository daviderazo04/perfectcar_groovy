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
            .content {
                width: 80%;
                margin: 0 auto;
                padding: 2rem;
            }
        .scaffold-create {
            width: 400px;
            margin: 4rem auto;
            background-color: #ffffff;
            padding: 3rem 3.5rem;
            border-radius: 1rem;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }
        .scaffold-create:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 2.8rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 2rem;
            color: #151018;
        }

        .form-group {
            margin-bottom: 1.8rem;
        }

        label {
            font-weight: 700;
            color: #151018;
            display: block;
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
        }

        input[type="text"],
        input[type="number"],
        input[type="url"],
        select,
        textarea {
            width: 100%;
            padding: 0.85rem 1.25rem;
            font-size: 1rem;
            border: 2px solid #dedede;
            border-radius: 0.8rem;
            background-color: #f7f7f7;
            transition: border-color 0.25s ease, box-shadow 0.25s ease;
            font-family: 'Inter', sans-serif;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="url"]:focus,
        select:focus,
        textarea:focus {
            border-color: #764ba2;
            box-shadow: 0 0 8px rgba(118, 75, 162, 0.6);
            outline: none;
            background-color: #fff;
        }

        button[type="button"] {
            background: #0069d9;
            color: white;
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.8rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            margin-top: 0.5rem;
            box-shadow: 0 4px 12px rgba(118, 75, 162, 0.4);
        }

        button[type="button"]:hover {
            background: #5a368f;
            box-shadow: 0 6px 15px rgba(90, 54, 143, 0.6);
        }

        #submit {
            background-color: #0069d9;
            color: white;
            padding: 1rem 3rem;
            font-size: 1.25rem;
            font-weight: 700;
            border: none;
            border-radius: 1rem;
            cursor: pointer;
            display: block;
            margin: 3rem auto 0;
            box-shadow: 0 6px 18px rgba(75, 54, 124, 0.5);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            font-family: 'Inter', sans-serif;
        }

        #submit:hover {
            background-color: #3e2f6b;
            box-shadow: 0 8px 24px rgba(62, 47, 107, 0.7);
        }

        /* Fotos container inputs */
        #fotosContainer input {
            margin-top: 0.8rem;
        }

        </style>
    </head>
    <body>
    <h1>Agrega tu vehiculo usado</h1>

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
        <div class="form-group" id="fotosContainer">
            <label>Fotos del Vehículo (URLs)</label>
            <input type="text" name="fotos[0].url" placeholder="URL de la foto 1" required />
        </div>
        <button type="button" onclick="agregarCampoFoto()">Agregar otra foto</button>

        <br/><br/>
        <g:submitButton name="create" id="submit" value="Guardar Vehículo"/>
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
