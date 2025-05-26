package perfectcar

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PersonaController {

    def lista() {
        def personas = Persona.list([sort: "nombre"])
        return [personas: personas]
    }

    def forma() {
        println "llega a forma: $params"

        def personaInstancia = Persona.get(params.id)
        return[persona: personaInstancia]
    }
    def guardar() {
        println("Guardar: $params")
        def persona

        if (params.id) {
            println "Edita Persona"
            persona = Persona.get(params.id)
            if (persona) {
                persona.properties = params
                if (persona.save(flush: true)) {
                    flash.message = "Persona actualizada correctamente."
                } else {
                    flash.message = "Error al actualizar la persona."
                    return render(view: "forma", model: [persona: persona])
                }
            }
        } else {
            println "Crea persona"
            persona = new Persona(params)
            if (persona.save(flush: true)) {
                flash.message = "Persona creada correctamente."
            } else {
                flash.message = "Error al guardar la persona."
                return render(view: "forma", model: [persona: persona])
            }
        }

        redirect(action: "lista")
    }


}
