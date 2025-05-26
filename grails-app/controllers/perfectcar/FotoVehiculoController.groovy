package perfectcar

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class FotoVehiculoController {

    FotoVehiculoService fotoVehiculoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond fotoVehiculoService.list(params), model:[fotoVehiculoCount: fotoVehiculoService.count()]
    }

    def show(Long id) {
        respond fotoVehiculoService.get(id)
    }

    def create() {
        respond new FotoVehiculo(params), model: [vehiculos: Vehiculo.list()]
    }

    def save(FotoVehiculo fotoVehiculo) {
        if (fotoVehiculo == null) {
            notFound()
            return
        }

        try {
            fotoVehiculoService.save(fotoVehiculo)
        } catch (ValidationException e) {
            respond fotoVehiculo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fotoVehiculo.label', default: 'FotoVehiculo'), fotoVehiculo.id])
                redirect fotoVehiculo
            }
            '*' { respond fotoVehiculo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond fotoVehiculoService.get(id)
    }

    def update(FotoVehiculo fotoVehiculo) {
        if (fotoVehiculo == null) {
            notFound()
            return
        }

        try {
            fotoVehiculoService.save(fotoVehiculo)
        } catch (ValidationException e) {
            respond fotoVehiculo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'fotoVehiculo.label', default: 'FotoVehiculo'), fotoVehiculo.id])
                redirect fotoVehiculo
            }
            '*'{ respond fotoVehiculo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        fotoVehiculoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'fotoVehiculo.label', default: 'FotoVehiculo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fotoVehiculo.label', default: 'FotoVehiculo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
