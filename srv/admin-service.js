const cds = require ('@sap/cds');

class AdminService extends cds.ApplicationService{
    init(){

        const { Authors } = this.entities;

        this.before ([ 'CREATE', 'UPDATE'] , Authors , this.ValidateLifeData);

        return super.init();

    }

    ValidateLifeData(req) {

        const { dateodBirth,dateofDeath } = req.data;

        const birth = new Date(dateodBirth);
        const Death = new Date( dateofDeath );

        if ( Death < birth ) {

            req.error( "Date of Death is before date of Birth ");
            

        }

    }

}

module.exports = AdminService;


