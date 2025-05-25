package perfectcar

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
                persona.save(flush: true)
            }
        } else {
            println "Crea persona"
            persona = new Persona(params)
            persona.save()
        }

        redirect(action: "lista")
    }

}
