@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Approver Projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true

define view entity ZLAM_SR_BOOKING_APPROVER 
    as projection on ZLAM_SR_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    
    CustomerId,
   
    CarrierId,
    
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _BookingSupplement: redirected to composition child ZLAM_SR_BOOKSUPPL_APPROVER,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZLAM_SR_TRAVEL_APPROVER
}
