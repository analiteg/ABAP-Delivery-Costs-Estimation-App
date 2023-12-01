@EndUserText.label: 'Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_WAREHOUSE_ADD
  as projection on ZI_WAREHOUSE_ADD
{
  key Uuid,
      Uuidw,
      @EndUserText.label: 'Warehouse Uuid'
      WUuid,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Warehouse Address'
      WAddress,
      @EndUserText.label: 'Warehouse Latitude'
      WLatitude,
      @EndUserText.label: 'Warehouse Longitude'
      WLongitude,
      /* Associations */
      _Warehouses,
      _Orders : redirected to parent ZC_ORDER
}
