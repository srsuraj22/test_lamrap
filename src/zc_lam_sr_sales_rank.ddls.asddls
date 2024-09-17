@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity which joins with TF'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_LAM_SR_SALES_RANK
    as select from ZLAM_SR_TF(p_clnt:$session.client) as ranked
inner join zlam_sr_bpa as bpa on
ranked.company_name = bpa.company_name
{
    key ranked.company_name,
    @Semantics.amount.currencyCode: 'currency_code'
    ranked.total_sales,
    ranked.currency_code,
    ranked.customer_rank,
    ZLAM_SR_CALC_AREA(
    radius => cast (3 as abap.int4)
    ) as Area
}
