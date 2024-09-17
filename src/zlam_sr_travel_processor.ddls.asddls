@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Travel Entity projection layer'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true

define root view entity ZLAM_SR_TRAVEL_PROCESSOR 
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
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_SR_VE_CALC'
    @EndUserText.label: 'CO2 Tax'
    virtual CO2Tax : abap.int4,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_SR_VE_CALC'
    @EndUserText.label: 'Week Day'
    virtual dayOfTheFlight : abap.char( 9 ),
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZLAM_SR_BOOKING_PROCESSOR,
    _Currency,
    _Customer,
    _OverallStatus
}
