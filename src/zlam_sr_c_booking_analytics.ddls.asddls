@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Analytics Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZLAM_SR_C_BOOKING_ANALYTICS as projection on ZLAM_SR_BOOKING_ANALYTICS
{
  key TravelID,
  
  key BookingID,
  
  BookingDate,
  
  @EndUserText.label: 'Booking Date (Year)'
  BookingDateYear,
  
  @EndUserText.label: 'Customer'
  @ObjectModel.text.element: [ 'CustomerName' ]
  CustomerID,
  
  CustomerName,
  
  @EndUserText.label: 'Airline'
  @ObjectModel.text.element: [ 'CarrierName' ]
  CarrierID,
  
  CarrierName,
  
  ConnectionID,
  
  FlightDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  @Aggregation.default: #SUM
  FlightPrice,
  
  CurrencyCode,
  
  @EndUserText.label: 'Agency'
  @ObjectModel.text.element: [ 'AgencyName' ]
  _Travel.AgencyID as AgencyID,
  
  _Travel._Agency.Name as AgencyName,
  
  @Semantics.user.createdBy: true
  _Travel.createdby,
  
  @Semantics.user.lastChangedBy: true
  _Travel.lastchangedby,
  
  _Travel,
  
  _Carrier,
  
  _Customer,
  
  _Connection
}
