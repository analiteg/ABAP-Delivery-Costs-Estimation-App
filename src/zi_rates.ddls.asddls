@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RATES
  as select from zarates as Rates
  association [1..*] to ZI_ORDER     as _Orders    on $projection.DelZone = _Orders.DelZone
  association [1..*] to ZI_ORDER_ALL as _AllOrders on $projection.DelZone = _AllOrders.DelZone
{
  key uuid_z        as UuidZ,
      uom_distance  as UomDistance,
      @Semantics.quantity.unitOfMeasure : 'UomDistance'
      min_distance  as MinDistance,
      @Semantics.quantity.unitOfMeasure : 'UomDistance'
      max_distance  as MaxDistance,
      del_zone      as DelZone,
      currency_code as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      zone_tarif    as ZoneTarif,
      _Orders,
      _AllOrders
}
