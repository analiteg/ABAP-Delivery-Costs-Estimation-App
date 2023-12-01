@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_WAREHOUSE_ADD
  as select from zaorder2 as WarehouseAdd

  association        to parent ZI_ORDER as _Orders     on $projection.Uuid = _Orders.Uuid
  association [0..1] to ZI_WAREHOUSES   as _Warehouses on $projection.Uuidw = _Warehouses.Uuidw


{

  key uuid                  as Uuid,
      uuid_w                as Uuidw,
      _Warehouses.Uuidw     as WUuid,
      _Warehouses.Address   as WAddress,
      _Warehouses.Latitude  as WLatitude,
      _Warehouses.Longitude as WLongitude,
      _Orders,
      _Warehouses




}
