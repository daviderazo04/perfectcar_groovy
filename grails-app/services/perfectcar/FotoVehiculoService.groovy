package perfectcar

import grails.gorm.services.Service

@Service(FotoVehiculo)
interface FotoVehiculoService {

    FotoVehiculo get(Serializable id)

    List<FotoVehiculo> list(Map args)

    Long count()

    void delete(Serializable id)

    FotoVehiculo save(FotoVehiculo fotoVehiculo)

}