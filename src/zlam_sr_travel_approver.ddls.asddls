@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver Travel Entity projection layer'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true

define root view entity ZLAM_SR_TRAVEL_APPROVER 
    as projection on ZLAM_SR_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    AgencyName,
    CustomerName,
    TravelStatus,
    TravelIcon,
    
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZLAM_SR_BOOKING_APPROVER,
    _Currency,
    _Customer,
    _OverallStatus
}
