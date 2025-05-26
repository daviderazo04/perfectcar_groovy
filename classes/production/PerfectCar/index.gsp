<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>PerfectCar</title>
    <asset:stylesheet src="estilos.css"/>

</head>
<body>

<div class="div-index-main" style="background-image: url('${assetPath(src: 'carrosBase/Mercedes_Main.png')}')">
    <h2 class="main-text">
        El auto perfecto <br> para ti a un<br> solo click
    </h2>
</div>
<div class="tarjetas-inicio">

    <g:link controller="vehiculo" action="create" class="tarjeta-ind-ini" style="background-image: url('${assetPath(src: 'carrosBase/carro-azul-inicio.webp')}')">
        <span>Vende tu carro</span>
    </g:link>

    <g:link controller="vehiculo" action="index" class="tarjeta-ind-ini" style="background-image: url('${assetPath(src: 'carrosBase/compra-carro-persona.avif')}')">
        <span>Conoce tu nuevo carro</span>
    </g:link>

</div>



<section class="vehiculos-destacados">
    <h2 >Vehículos Destacados</h2>
    <div class="slider-container">
        <button class="arrow left" onclick="scrollSlider(-1)">❮</button>
        <div class="vehiculos-slider" id="vehiculos-slider">
            <a href="#" class="vehiculo-card" style="background-image: url('${assetPath(src: 'carrosBase/hyundai-tucson-2022.jpeg')}')">
                <div class="info">
                    <h3>Hyundai Tucson 2022</h3>
                    <p>$24,900 · 35,000 km</p>
                </div>
            </a>
            <a href="#" class="vehiculo-card" style="background-image: url('${assetPath(src: 'carrosBase/kia-sportage-2021.jpg')}')">
                <div class="info">
                    <h3>Kia Sportage 2021</h3>
                    <p>$21,500 · 28,000 km</p>
                </div>
            </a>
            <a href="#" class="vehiculo-card" style="background-image: url('${assetPath(src: 'carrosBase/toyota-corolla-2020.jpeg')}')">
                <div class="info">
                    <h3>Toyota Corolla 2020</h3>
                    <p>$18,700 · 42,000 km</p>
                </div>
            </a>
            <a href="#" class="vehiculo-card" style="background-image: url('${assetPath(src: 'carrosBase/ford-ranger-2023.jpg')}')">
                <div class="info">
                    <h3>Ford Ranger 2023</h3>
                    <p>$32,000 · 10,000 km</p>
                </div>
            </a>
            <a href="#" class="vehiculo-card" style="background-image: url('${assetPath(src: 'carrosBase/chev-cruze-2021.avif')}')">
                <div class="info">
                    <h3>Chevrolet Cruze 2021</h3>
                    <p>$19,300 · 30,000 km</p>
                </div>
            </a>
        </div>
        <button class="arrow right" onclick="scrollSlider(1)">❯</button>
    </div>
</section>
<script>
    function scrollSlider(direction) {
        const slider = document.getElementById('vehiculos-slider');
        const scrollAmount = 320; // scroll aproximadamente el ancho de una tarjeta

        slider.scrollBy({
            left: direction * scrollAmount,
            behavior: 'smooth'
        });
    }
</script>


</body>
</html>
