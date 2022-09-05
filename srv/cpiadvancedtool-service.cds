using {cpiadvancedtool as cvt} from '../db/CPISchema';

service CPIAdvancedTool @(path : 'service/cpiadvancedtool') {
    entity MessStat as projection on cvt.CPIMessStat;
    annotate MessStat with @odata.draft.enabled;

}