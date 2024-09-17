@AbapCatalog.sqlViewName: 'ZLAMSRBPACDSV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Business Partner Table'
@Metadata.ignorePropagatedAnnotations: true
define view ZLAM_SR_BPA_CDSV as select from zlam_sr_bpa
{
   key bp_id as BpId,
   bp_role as BpRole,
   company_name as CompanyName,
   street as Street,
   country as Country,
   region as Region,
   city as City 
}
