@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root entity for my BO'
@Metadata.ignorePropagatedAnnotations: true


define root view entity ZLAM_SR_TRAVEL as select from /dmo/travel_m
 
--Composition child for travel viz booking
composition[0..*] of ZLAM_SR_BOOKING as _Booking
--associations - lose coupling to get dependent data
association[1] to /DMO/I_Agency as _Agency on
    $projection.AgencyId = _Agency.AgencyID
association[1] to /DMO/I_Customer as _Customer on
    $projection.CustomerId = _Customer.CustomerID
association[1] to I_Currency as _Currency on
    $projection.CurrencyCode = _Currency.Currency
association[1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on
    $projection.OverallStatus = _OverallStatus.OverallStatus
{
    @ObjectModel.text.element: [ 'Description' ]
    key travel_id as TravelId,
    
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{
        entity.name: '/DMO/I_Agency',
        entity.element: 'AgencyID'
     }]
    agency_id as AgencyId,   
    @Semantics.text: true
    _Agency.Name as AgencyName,
    
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Consumption.valueHelpDefinition: [{
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
     }]
    customer_id as CustomerId,    
    @Semantics.text: true
    _Customer.FirstName as CustomerName,
    
    begin_date as BeginDate,
    end_date as EndDate,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    
    @Consumption.valueHelpDefinition: [{
        entity.name: 'I_Currency',
        entity.element: 'Currency'
        
     }]
    currency_code as CurrencyCode,
    
    @Semantics.text: true
    description as Description,
    
    @Consumption.valueHelpDefinition: [{
        entity.name: '/DMO/I_Overall_Status_VH',
        entity.element: 'OverallStatus'
     }]
    overall_status as OverallStatus,
    
    case overall_status
        when 'O' then 'Open'
        when 'R' then 'Rejected'
        when 'A' then 'Approved'
        else 'Unknown'
        end as TravelStatus,
    case overall_status
        when 'O' then 2
        when 'R' then 1
        when 'A' then 3
        else 0
        end as TravelIcon,
        
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    //Local ETag Field --> Odata Etag
    last_changed_at as LastChangedAt,
    /*Expose associations*/
    _Booking,
    _Agency,
    _Customer,
    _Currency,
    _OverallStatus
}
