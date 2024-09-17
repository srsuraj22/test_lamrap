@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Business Partners interface entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_LAM_SR_BPA as select from zlam_sr_bpa
association[0..1] to I_Country as _Country on
$projection.CountryCode = _Country.Country
{
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as CountryCode,
    region as Region,
    city as City,
    --ad hoc association
    _Country._Text[Language = $session.system_language].CountryName as CountryName
    --exposed association
    --_Country
}
