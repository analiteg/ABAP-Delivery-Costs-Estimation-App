@EndUserText.label: 'Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZC_ORDER_ALL
  as projection on ZI_ORDER_ALL
{
  key Uuid,
      Uuidw,
      @Search.defaultSearchElement: true
      Cname,
      @Search.defaultSearchElement: true
      Address,
      DelStatus,
      Vaddress,
      Longitude,
      Latitude,
      DelDistance,
      DelTime,
      DelZone,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      DelCost,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Currency,
      _Rates,
      _Warehouses,
      _Orders : redirected to parent ZC_ORDER
}
