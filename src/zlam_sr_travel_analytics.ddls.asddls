@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Analytics'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZLAM_SR_TRAVEL_ANALYTICS as select from /dmo/travel as Travel
  association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
{
  key travel_id as TravelID,
  agency_id as AgencyID,
  customer_id as CustomerID,
  begin_date as BeginDate,
  end_date as EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  booking_fee as BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  total_price as TotalPrice,
  currency_code as CurrencyCode,
  description as Description,
  status as OverallStatus,
  @Semantics.user.createdBy: true
  createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat,
  @Semantics.user.lastChangedBy: true
  lastchangedby,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat,
  _Agency,
  _Customer 
}
