namespace cpiadvancedtool;
 using { managed } from '@sap/cds/common';

entity CPIMessStat : managed {
 key TENANT_NAME : String(255);
 key MESSAGE_ID : String(255);
 IFLOW_ID : String(255);
 START_TIME : DateTime;
 END_TIME: DateTime;
 STATUS : String(20);
 ERROR_INFO: String(5000);
 TIMEZONE: String(6);
 }