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
      @EndUserText.label: 'Customer Name'
      Cname,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Delivery Initial Address'
      Address,
      @EndUserText.label: 'Delivery Status'
      DelStatus,
      @EndUserText.label: 'Delivery Verified Address'
      Vaddress,
      @EndUserText.label: 'Delivery Point Longitude'
      Longitude,
      @EndUserText.label: 'Delivery Point Latitude'
      Latitude,
      UomDistance,
      @EndUserText.label: 'Delivery Distance'
      DelDistance,
      UomTime,
      @EndUserText.label: 'Delivery Time'
      DelTime,
      @EndUserText.label: 'Delivery Zone'
      DelZone,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Delivery Costs'
      DelCost,
      @EndUserText.label: 'Created By'
      CreatedBy,
      @EndUserText.label: 'Created At'
      CreatedAt,
      @EndUserText.label: 'Local Last Changed By'
      LocalLastChangedBy,
      @EndUserText.label: 'Local Last Changed At'
      LocalLastChangedAt,
      @EndUserText.label: 'Last Changed At'
      LastChangedAt,

      /* Associations */
      _Currency,
      _Rates,
      _Warehouses,
      _Orders : redirected to parent ZC_ORDER
}
