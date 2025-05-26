<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <style>
    .content{
        padding: 2rem;
    }

    #edit-vehiculo {
        max-width: 900px;
        margin: 0 auto;
        background-color: #ffffff;
        border-radius: 12px;
        padding: 2rem;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    h1 {
        font-size: 2rem;
        margin-bottom: 1.5rem;
        color: #222;
        border-bottom: 2px solid #ddd;
        padding-bottom: 0.5rem;
    }

    .message {
        background-color: #e6f7ff;
        color: #004085;
        border: 1px solid #b8daff;
        padding: 1rem;
        border-radius: 8px;
        margin-bottom: 1rem;
        font-weight: bold;
    }

    ul.errors {
        background-color: #fdecea;
        border: 1px solid #f5c2c7;
        color: #842029;
        padding: 1rem;
        border-radius: 8px;
        margin-bottom: 1.5rem;
        list-style-type: none;
    }

    fieldset.form {
        display: grid;
        gap: 1.2rem;
    }

    fieldset.buttons {
        display: flex;
        justify-content: center;
        margin-top: 2rem;
        gap: 1rem;
    }

    input.save {
        background-color: #151018;
        color: white;
        font-size: 1.1rem;
        padding: 0.8rem 2rem;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }

    input.save:hover {
        background-color: #2c2a3a;
    }

    label {
        font-weight: 600;
        color: #333;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 0.75rem;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }

    .image-preview {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 1rem;
    }

    .image-preview img {
        max-width: 150px;
        border-radius: 8px;
        border: 1px solid #ccc;
    }

    @media (max-width: 600px) {
        input.save {
            width: 100%;
        }

        .image-preview img {
            max-width: 100px;
        }
    }
    </style>

</head>
<body>
<div id="edit-vehiculo" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${this.vehiculo}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.vehiculo}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}" />
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form resource="${this.vehiculo}" method="PUT">
        <g:hiddenField name="version" value="${this.vehiculo?.version}" />
        <fieldset class="form">
            <f:all bean="vehiculo" />

            <!-- Campo para editar URL de las fotos -->
            <div>
            <g:each in="${vehiculo.fotos}" var="foto" >
                <g:each in="${foto.url?.tokenize(',')}" var="fotoUrl">
                    <img src="${fotoUrl.trim()}" alt="Foto del vehículo" style="width: 50rem; padding: 2rem;"/>
                </g:each>
            </g:each>

            </div>
        </fieldset>

        <fieldset class="buttons">
            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
<script>
    function updateImagePreviews() {
        const input = document.getElementById("fotoInput");
        const container = document.getElementById("previewContainer");
        const urls = input.value.split(',').map(u => u.trim()).filter(Boolean);
        container.innerHTML = "";
        urls.forEach(url => {
            const img = document.createElement("img");
        img.src = url;
        img.alt = "Foto del vehículo";
        container.appendChild(img);
    });
    }

    window.addEventListener("DOMContentLoaded", () => {
        updateImagePreviews();
    document.getElementById("fotoInput").addEventListener("input", updateImagePreviews);
    });
</script>
</body>
</html>
