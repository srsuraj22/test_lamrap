@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Approver Projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true

define view entity ZLAM_SR_BOOKSUPPL_APPROVER 
    as projection on ZLAM_SR_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @Consumption.valueHelpDefinition: [{
        entity.name: '/DMO/I_Supplement',
        entity.element: 'SupplementID'
     }] 
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking: redirected to parent ZLAM_SR_BOOKING_APPROVER,
    _Product,
    _SupplementText,
    _Travel: redirected to ZLAM_SR_TRAVEL_APPROVER
}
