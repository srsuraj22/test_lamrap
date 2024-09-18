@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Analytics'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZLAM_SR_BOOKING_ANALYTICS as select from /dmo/booking as Booking
  association [0..1] to ZLAM_SR_TRAVEL_ANALYTICS as _Travel on $projection.TravelID = _Travel.TravelID
  association [1..1] to /DMO/I_Connection as _Connection on $projection.CarrierID = _Connection.AirlineID and $projection.ConnectionID = _Connection.ConnectionID
  association [1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierID = _Carrier.AirlineID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
{
  key _Travel.TravelID as TravelID,
  key booking_id as BookingID,
  booking_date as BookingDate,
  substring (booking_date,1,4) as BookingDateYear,
  customer_id as CustomerID,
  _Customer.LastName as CustomerName,
  carrier_id as CarrierID,
  _Carrier.Name as CarrierName,
  connection_id as ConnectionID,
  flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  flight_price as FlightPrice,
  currency_code as CurrencyCode,
  _Travel,
  _Carrier,
  _Customer,
  _Connection
}
