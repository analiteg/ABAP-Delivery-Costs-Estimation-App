@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interface View'
define root view entity ZI_ORDER
  as select from zaorder2 as Orders

  association [0..1] to ZI_WAREHOUSES as _Warehouses on $projection.Uuidw = _Warehouses.Uuidw
  association [0..1] to I_Currency    as _Currency   on $projection.CurrencyCode = _Currency.Currency
  association [0..*] to ZI_RATES      as _Rates      on $projection.DelZone = _Rates.DelZone
{
  key uuid                  as Uuid,
      uuid_w                as Uuidw,
      cname                 as Cname,
      address               as Address,
      del_status            as DelStatus,
      vaddress              as Vaddress,
      longitude             as Longitude,
      latitude              as Latitude,
      del_distance          as DelDistance,
      del_time              as DelTime,
      del_zone              as DelZone,
      currency_code         as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      del_cost              as DelCost,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Currency,
      _Rates,
      _Warehouses 
}
