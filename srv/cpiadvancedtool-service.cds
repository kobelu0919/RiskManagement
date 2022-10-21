using {cpiadvancedtool as cvt} from '../db/CPISchema';

service CPIAdvancedTool @(path : 'service/cpiadvancedtool') {

    entity MessStat as projection on cvt.CPIMessStat;
    annotate MessStat with @odata.draft.enabled;

    entity MessPayload as projection on cvt.CPIMessPayload;
    annotate MessPayload with @odata.draft.enabled;

}