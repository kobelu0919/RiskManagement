using riskmanagement as rm from '../db/schema';
using cpiadvancedtool as cvt from '../db/CPISchema';

 // Annotate Risk elements
 annotate rm.Risks with {
 ID     @title : 'Risk';
 title  @title : 'Title';
 owner  @title : 'Owner';
 prio   @title : 'Priority';
 descr  @title : 'Description';
 miti   @title : 'Mitigation';
 impact @title : 'Impact';
 } 

// Annotate Miti elements
 annotate rm.Mitigations with {
 ID @( 
      UI.Hidden,
      Common : {Text : descr}
 ); 
owner @title : 'Owner';
descr @title : 'Description';
 }

annotate rm.Risks with {
   miti @(Common : {
    //show text, not id for mitigation in the context of risks
    Text            : miti.descr,
    TextArrangement : #TextOnly,
    ValueList       : {
    Label          : 'Mitigations',
    CollectionPath : 'Mitigations',
    Parameters     : [
       {
       $Type : 'Common.ValueListParameterInOut',
       LocalDataProperty : miti_ID,
       ValueListProperty : 'ID'
       },
       {
       $Type : 'Common.ValueListParameterDisplayOnly',
       ValueListProperty : 'descr'
       }
    ]
    }
  });
 }


annotate cvt.CPIMessStat with {
 TENANT_NAME     @title : 'tenant name';
 MESSAGE_ID  @title : 'message id';
 IFLOW_ID    @title : 'iflow name';
 START_TIME   @title : 'start time';
 END_TIME  @title : 'end time';
 STATUS   @title : 'status';
 ERROR_INFO @title : 'error info';
 TIMEZONE @title : 'time zone';
 DURATION @title : 'duration';
 } 


 annotate cvt.CPIMessPayload with {
 TENANT_NAME     @title : 'tenant name';
 MESSAGE_ID  @title : 'message id';
 STEP @title: 'step';
 PAYLOAD @title : 'payload';
 } 