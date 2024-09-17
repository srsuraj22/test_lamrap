@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytic query, consumption view for Sales'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.query: true

define view entity ZI_LAM_SR_SALES_ANA as select from ZI_LAM_SR_SALES_CUBE
{
  key _BusinessPartner.CompanyName,
  key _BusinessPartner.CountryName,
  GrossAmount,
  CurrencyCode,
  Quantity,
  UnitOfMeasure  
}
