// Imports
const cds = require("@sap/cds");

/**
  * The service implementation with all service handlers
  */
module.exports = cds.service.impl(async function () {
/**
  * Set criticality after a READ operation on /risks
  */
    this.after('READ', 'MessStat', mess => {
        const records = Array.isArray(mess) ? mess : [mess];

        records.forEach(message => {
            
            var enddate = new Date(message.END_TIME);
            var startdate = new Date(message.START_TIME);
            
            var difference = enddate.getTime() - startdate.getTime();   
                     

            if (difference <  10000 ) {
                message.criticality2 = 3;
            } 
            else if (difference > 600000) {
                message.criticality2 = 1;
            }
            else {
                message.criticality2 = 2;
            }

            message.DURATION = difference.toString() + 'ms'; 



            if (message.STATUS === 'COMPLETED') {
                message.criticality = 3;
            } 
            else if (message.STATUS === 'FAILED') {
                message.criticality = 1;
            }
            else {
                message.criticality = 2;
            }
        });
    });
});
