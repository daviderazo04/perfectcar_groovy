<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <style>

    #show-vehiculo {
        max-width: 900px;
        margin: 0 auto;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        padding: 4rem;
    }

    h1 {
        font-size: 2.4rem;
        margin-bottom: 1.5rem;
        color: #151018;
        border-bottom: 2px solid #151018;
        padding-bottom: 0.5rem;
    }

    .message {
        background-color: #e0f7fa;
        color: #004d40;
        padding: 1rem 1.5rem;
        border-radius: 0.5rem;
        margin-bottom: 1.5rem;
        font-weight: 600;
    }

    .vehiculo-details {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
        margin-bottom: 2rem;
    }

    .vehiculo-info p {
        margin: 0.4rem 0;
        font-size: 1.1rem;
        color: #555;
    }

    .vehiculo-info strong {
        color: #151018;
    }

    .vehiculo-photos {
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        align-items: center;
        gap: 1rem;
        justify-content: center;
        padding-top: 2rem;
        padding-bottom: 2rem;
    }

    .vehiculo-photos img {
        width: 80%;
        height: auto;
        object-fit: cover;
        border-radius: 10px;
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
        transition: transform 0.3s ease;
        cursor: pointer;

    }

    .vehiculo-photos img:hover {
        transform: scale(1.02);
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
    }

    fieldset.buttons {
        display: flex;
        gap: 1.5rem;
        justify-content: center;
        border: none;
        padding: 0;
    }

    a.edit, input.delete {
        background-color: #151018;
        color: white;
        border: none;
        padding: 0.8rem 2rem;
        font-size: 1.1rem;
        font-weight: 700;
        border-radius: 0.7rem;
        cursor: pointer;
        text-decoration: none;
        text-align: center;
        transition: background-color 0.3s ease;
    }

    a.edit:hover {
        background-color: #2c2a3a;
    }

    input.delete:hover {
        background-color: #a32a2a;
    }

    /* Responsive */
    @media (max-width: 700px) {
        .vehiculo-details {
            grid-template-columns: 1fr;
        }
        .vehiculo-photos img {
            width: 48%;
            height: 140px;
        }
    }
    @media (max-width: 400px) {
        .vehiculo-photos img {
            width: 100%;
            height: 180px;
        }
    }
    </style>
</head>
<body>
<div id="show-vehiculo" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="vehiculo-photos">
        <g:each in="${vehiculo.fotos}" var="foto">
            <g:each in="${foto.url?.tokenize(',')}" var="fotoUrl">
                <img src="${fotoUrl.trim()}" alt="Foto del vehículo" />
            </g:each>
        </g:each>
    </div>
    <div class="vehiculo-details">
        <div class="vehiculo-info">
            <p><strong>Marca:</strong> ${vehiculo.marca}</p>
            <p><strong>Modelo:</strong> ${vehiculo.modelo}</p>
            <p><strong>Año:</strong> ${vehiculo.anio}</p>
            <p><strong>Color:</strong> ${vehiculo.color}</p>
            <p><strong>Precio:</strong> $${vehiculo.precio}</p>
        </div>

    </div>

    <g:form resource="${vehiculo}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${vehiculo}">
                Editar
            </g:link>
            <input
                    class="delete"
                    type="submit"
                    value="Eliminar vehiculo"
                    onclick="return confirm('¿Estas seguro de eliminar este vehiculo?');"
            />
        </fieldset>
    </g:form>
</div>
</body>
</html>
