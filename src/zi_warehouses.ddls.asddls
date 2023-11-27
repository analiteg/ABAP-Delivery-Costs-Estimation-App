@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_WAREHOUSES
  as select from zawarehouse2 as Warehouses
  association [1..*] to ZI_ORDER as _Orders on $projection.Uuidw = _Orders.Uuidw
{
  key uuid_w    as Uuidw,
      address   as Address,
      longitude as Longitude,
      latitude  as Latitude,
      _Orders
}
