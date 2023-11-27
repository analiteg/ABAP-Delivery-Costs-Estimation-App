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
  as select from ZARATES as Rates
  association [1..*] to ZI_ORDER as _Orders on $projection.DelZone = _Orders.DelZone
{
  key uuid_z       as UuidZ,
      min_distance as MinDistance,
      max_distance as MaxDistance,
      del_zone     as DelZone,
      zone_tarif   as ZoneTarif,
      _Orders
}
