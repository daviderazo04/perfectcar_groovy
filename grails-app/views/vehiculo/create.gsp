<!DOCTYPE html>
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
        </style>
    </head>
    <body>
        <div id="create-vehiculo" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.vehiculo}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.vehiculo}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.vehiculo}" method="POST">
                <fieldset class="form">
                    <f:all bean="vehiculo"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
