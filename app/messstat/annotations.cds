using CPIAdvancedTool as service from '../../srv/cpiadvancedtool-service';

annotate service.MessStat with @(UI:{
    SelectionFields : [STATUS],
    Identification : [{Value : MESSAGE_ID},{Value : IFLOW_ID}],
    LineItem : [
        {
            Value : MESSAGE_ID,
        },
        {
            Value : TENANT_NAME,
        },
        {
            Value : IFLOW_ID,
        },
        {
            Value : START_TIME,
        },
        {
            Value : END_TIME,
        },
        {
            Value : DURATION,
            Criticality : criticality2
        },
        {
            Value : STATUS,
            Criticality : criticality
        },
    ],
});


annotate service.MessStat with @(
    Capabilities.DeleteRestrictions  : {
        Deletable : false
    },
    Capabilities.InsertRestrictions : {
        Insertable : false,
    }
);


annotate service.MessStat with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : TENANT_NAME,
            },
            {
                Value : MESSAGE_ID,
            },
            {
                Value : IFLOW_ID,
            },
            {
                Value : START_TIME,
            },
            {
                Value : END_TIME,
            },
            {
                Value : STATUS,
            },
            {
                Value : ERROR_INFO,
            },
            {
                Value : TIMEZONE,
            },
        ],
    },
    

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        }
    ]
);


