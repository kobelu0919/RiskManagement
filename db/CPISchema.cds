namespace cpiadvancedtool;

using { managed, cuid } from '@sap/cds/common';

entity CPIMessStat : cuid, managed
{
    key TENANT_NAME : String(255);
    key MESSAGE_ID : String(255);
    IFLOW_ID : String(255) not null;
    START_TIME : Timestamp not null;
    END_TIME : Timestamp not null;
    STATUS : String(20) not null;
    ERROR_INFO : String(5000);
    TIMEZONE : String(6) not null;
    criticality : Integer;
    criticality2 : Integer;
    DURATION : String;
    PAYLOADS : Association to many CPIMessPayload on PAYLOADS.PARENTMESSAGE.ID = $self.ID;
}

entity CPIMessPayload : cuid, managed
{
    key TENANT_NAME : String(255);
    key MESSAGE_ID : String(255);
    key STEP : String(8);
    PAYLOAD : LargeString not null;
    PARENTMESSAGE : Association to one CPIMessStat;
}
