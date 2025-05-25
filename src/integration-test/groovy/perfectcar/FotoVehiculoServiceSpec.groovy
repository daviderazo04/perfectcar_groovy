package perfectcar

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class FotoVehiculoServiceSpec extends Specification {

    FotoVehiculoService fotoVehiculoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new FotoVehiculo(...).save(flush: true, failOnError: true)
        //new FotoVehiculo(...).save(flush: true, failOnError: true)
        //FotoVehiculo fotoVehiculo = new FotoVehiculo(...).save(flush: true, failOnError: true)
        //new FotoVehiculo(...).save(flush: true, failOnError: true)
        //new FotoVehiculo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //fotoVehiculo.id
    }

    void "test get"() {
        setupData()

        expect:
        fotoVehiculoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<FotoVehiculo> fotoVehiculoList = fotoVehiculoService.list(max: 2, offset: 2)

        then:
        fotoVehiculoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        fotoVehiculoService.count() == 5
    }

    void "test delete"() {
        Long fotoVehiculoId = setupData()

        expect:
        fotoVehiculoService.count() == 5

        when:
        fotoVehiculoService.delete(fotoVehiculoId)
        sessionFactory.currentSession.flush()

        then:
        fotoVehiculoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        FotoVehiculo fotoVehiculo = new FotoVehiculo()
        fotoVehiculoService.save(fotoVehiculo)

        then:
        fotoVehiculo.id != null
    }
}
