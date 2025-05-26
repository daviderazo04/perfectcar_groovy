package perfectcar

class FotoVehiculo {
    String url

    static belongsTo = [vehiculo: Vehiculo]

    static mapping = {
        table 'foto_vehiculo'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'foto_vehiculo_id'
        id generator: 'identity'
        version false
        columns {
            url column: 'url'
            vehiculo column: 'vehiculo_id'
        }
    }

    static constraints = {
        url(blank: false, nullable: false)  // quita url:true
        //url(url: true, blank: false, nullable: false, attributes: [title: 'URL de la Foto'])
    }

    String toString() {
        return url
    }
}
