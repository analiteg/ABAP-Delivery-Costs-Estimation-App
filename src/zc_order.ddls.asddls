@EndUserText.label: 'Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_ORDER
  provider contract transactional_query
  as projection on ZI_ORDER
{
  key Uuid,
      Uuidw,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Customer Name'
      Cname,
      @Search.defaultSearchElement: true
      Address,
      @EndUserText.label: 'Delivery Status'
      DelStatus,
      @EndUserText.label: 'Verified Address'
      Vaddress,
      @EndUserText.label: 'Delivery Distance'
      DelDistance,
      @EndUserText.label: 'Delivery Time'
      DelTime,
      @EndUserText.label: 'Delivery Zone'
      DelZone,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
       @EndUserText.label: 'Delivery Costs'
      DelCost,
      //      CreatedBy,
      //      CreatedAt,
      //      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Currency,
      _Rates,
      _Warehouses,
      _AllOrders : redirected to composition child ZC_ORDER_ALL
}
