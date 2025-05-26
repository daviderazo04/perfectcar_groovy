<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <style>
        h1{
            font-size: 4rem;
            font-weight:bolder;
        }
    .vehiculo-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
        margin-top: 2rem;
    }

    .vehiculo-card {
        background-color: #fff;
        height: 500px;
        border-radius: 1rem;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        padding: 1rem;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .carousel-container {
        position: relative;
        width: 100%;
        height: 400px;
        overflow: hidden;
        border-radius: 0.5rem;
        margin-bottom: 1rem;
    }

    .carousel-slide {
        display: flex;
        transition: transform 0.5s ease;
        width: 100%;
        height: 100%;
    }

    .carousel-slide img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        flex-shrink: 0;
    }

    .carousel-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background-color: rgba(0,0,0,0.5);
        color: white;
        border: none;
        padding: 0.3rem 0.7rem;
        font-size: 1rem;
        border-radius: 0.3rem;
        cursor: pointer;
        z-index: 1;
    }

    .prev-btn {
        left: 5px;
    }

    .next-btn {
        right: 5px;
    }

    .vehiculo-card h2 {
        font-size: 1.4rem;
        margin-bottom: 0.5rem;
    }

    .vehiculo-card p {
        margin: 0.3rem 0;
        color: #555;
    }

    .vehiculo-actions {
        margin-top: 1rem;
        display: flex;
        gap: 1rem;
        justify-content: center;
    }

    .vehiculo-actions a {
        background-color: #151018;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .vehiculo-actions a:hover {
        background-color: #292030;
    }

    .message {
        background-color: #e0f7fa;
        color: #004d40;
        padding: 1rem;
        border-radius: 0.5rem;
        margin-bottom: 1rem;
    }
        .content{ padding: 2rem}
    </style>
</head>
<body>


<div id="list-vehiculo" class="content scaffold-list" role="main">
    <h1>Vehiculos Disponibles</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="vehiculo-grid">
        <g:each in="${vehiculoList}" var="vehiculo" status="i">
            <div class="vehiculo-card">
                <div class="carousel-container">
                    <div class="carousel-slide" id="slide-${vehiculo.id}">
                        <g:each in="${vehiculo.fotos}" var="foto">
                            <g:each in="${foto.url?.tokenize(',')}" var="fotoUrl">
                                <img src="${fotoUrl.trim()}" alt="Foto del vehículo" />
                            </g:each>
                        </g:each>
                    </div>
                    <button class="carousel-btn prev-btn" onclick="moveSlide(${vehiculo.id}, -1)">&#10094;</button>
                    <button class="carousel-btn next-btn" onclick="moveSlide(${vehiculo.id}, 1)">&#10095;</button>
                </div>

                <h2>${vehiculo.marca} ${vehiculo.modelo}</h2>
                <p><strong>Año:</strong> ${vehiculo.anio}</p>
                <p><strong>Color:</strong> ${vehiculo.color}</p>
                <p><strong>Precio:</strong> $${vehiculo.precio}</p>

                <div class="vehiculo-actions">
                    <g:link action="show" id="${vehiculo.id}">Ver</g:link>
                </div>
            </div>
        </g:each>
    </div>

    <div class="pagination" style="margin-top: 3rem;">
        <g:paginate total="${vehiculoCount ?: 0}" />
    </div>
</div>

<script>
    const slideIndices = {};

    function moveSlide(carouselId, direction) {
        const slideContainer = document.getElementById("slide-" + carouselId);
        const slides = slideContainer.children;
        const totalSlides = slides.length;

        if (!(carouselId in slideIndices)) {
            slideIndices[carouselId] = 0;
        }

        slideIndices[carouselId] += direction;

        if (slideIndices[carouselId] < 0) {
            slideIndices[carouselId] = totalSlides - 1;
        } else if (slideIndices[carouselId] >= totalSlides) {
            slideIndices[carouselId] = 0;
        }

        const offset = -slideIndices[carouselId] * 100;
        slideContainer.style.transform = "translateX(" + offset + "%)";
    }
</script>
</body>
</html>
