@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Composite interface CDS entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #CUBE

define view entity ZI_LAM_SR_SALES_CUBE as select from ZI_LAM_SR_SALES
association[1] to ZI_LAM_SR_BPA as _BusinessPartner on
$projection.Buyer = _BusinessPartner.BpId
association[1] to ZI_LAM_SR_PRODUCT as _Product on
$projection.Product = _Product.ProductId
{
    key ZI_LAM_SR_SALES.OrderId,
    key ZI_LAM_SR_SALES._Items.item_id as ItemId,
    ZI_LAM_SR_SALES.OrderNo,
    ZI_LAM_SR_SALES.Buyer,
    ZI_LAM_SR_SALES.CreatedBy,
    ZI_LAM_SR_SALES.CreatedOn,
    /* Associations */
    ZI_LAM_SR_SALES._Items.product as Product,
    @DefaultAggregation: #SUM
    @Semantics.amount.currencyCode: 'CurrencyCode'
    ZI_LAM_SR_SALES._Items.amount as GrossAmount,
    ZI_LAM_SR_SALES._Items.currency as CurrencyCode,
    @DefaultAggregation: #SUM
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    ZI_LAM_SR_SALES._Items.qty as Quantity,
    ZI_LAM_SR_SALES._Items.uom as UnitOfMeasure,
    _Product,
    _BusinessPartner
}
