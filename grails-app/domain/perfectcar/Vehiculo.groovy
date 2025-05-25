package perfectcar

class Vehiculo {
    String marca
    String modelo
    String anio
    String color
    String placa
    Double precio

    static hasMany = [fotos: FotoVehiculo]

    static mapping = {
        table 'vehiculo'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'vehiculo_id'
        id generator: 'identity'
        version false
        columns {
            marca column: 'marca'
            modelo column: 'modelo'
            año column: 'año'
            color column: 'color'
            placa column: 'placa'
            precio column: 'precio'
        }
        fotos cascade: 'all-delete-orphan'
    }

    static constraints = {
        marca(size: 1..50, blank: false, nullable: false, attributes: [title: 'Marca'])
        modelo(size: 1..50, blank: false, nullable: false, attributes: [title: 'Modelo'])
        anio(matches: /\d{4}/, blank: false, nullable: false, attributes: [title: 'Año'])
        color(size: 1..30, blank: false, nullable: false, attributes: [title: 'Color'])
        placa(size: 6..10, unique: true, blank: false, nullable: false, attributes: [title: 'Placa'])
        precio(min: 0D, nullable: false, attributes: [title: 'Precio'])
    }

    String toString() {
        return "${marca} ${modelo} (${placa})"
    }
}
