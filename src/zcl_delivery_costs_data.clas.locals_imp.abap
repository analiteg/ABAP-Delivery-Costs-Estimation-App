CLASS lcl_delivery DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    TYPES ty_orders    TYPE STANDARD TABLE OF zaorder2    WITH KEY uuid uuid_w.
    TYPES ty_warehouse TYPE STANDARD TABLE OF zawarehouse2 WITH KEY uuid_w.
    TYPES ty_rates     TYPE STANDARD TABLE OF zarates   WITH KEY min_distance max_distance.

    METHODS save_warehouses_data_into_db
      IMPORTING it_warehouse     TYPE STANDARD TABLE
      RETURNING VALUE(rv_status) TYPE string
      RAISING   cx_static_check.

    METHODS save_rates_data_into_db
      IMPORTING it_rates         TYPE STANDARD TABLE
      RETURNING VALUE(rv_status) TYPE string
      RAISING   cx_static_check.

    METHODS save_orders_data_into_db
      IMPORTING it_orders        TYPE STANDARD TABLE
      RETURNING VALUE(rv_status) TYPE string
      RAISING   cx_static_check.

    METHODS get_warehouses
      RETURNING VALUE(rt_warehouse) TYPE ty_warehouse
      RAISING   cx_static_check.

    CLASS-METHODS create_instance
      RETURNING VALUE(ro_delivery) TYPE REF TO lcl_delivery.

  PRIVATE SECTION.
    CLASS-DATA lo_delivery TYPE REF TO lcl_delivery.

ENDCLASS.


CLASS lcl_delivery IMPLEMENTATION.
  METHOD create_instance.
    ro_delivery = COND #( WHEN lo_delivery IS BOUND
                          THEN lo_delivery
                          ELSE NEW lcl_delivery( )  ).
    lo_delivery = ro_delivery.
  ENDMETHOD.

  METHOD save_warehouses_data_into_db.
    INSERT zawarehouse2 FROM TABLE @it_warehouse ACCEPTING DUPLICATE KEYS.
    IF sy-subrc = 0.
      rv_status = | Inserted | & |{ lines( it_warehouse ) }| & | rows|.
    ELSE.
      rv_status = | Error | & |{ sy-subrc }|.
    ENDIF.
  ENDMETHOD.

  METHOD save_rates_data_into_db.
    INSERT zarates FROM TABLE @it_rates ACCEPTING DUPLICATE KEYS.
    IF sy-subrc = 0.
      rv_status = | Inserted | & |{ lines( it_rates ) }| & | rows|.
    ELSE.
      rv_status = | Error | & |{ sy-subrc }|.
    ENDIF.
  ENDMETHOD.

  METHOD save_orders_data_into_db.
    INSERT zaorder2 FROM TABLE @it_orders ACCEPTING DUPLICATE KEYS.
    IF sy-subrc = 0.
      rv_status = | Inserted | & |{ lines( it_orders ) }| & | rows|.
    ELSE.
      rv_status = | Error | & |{ sy-subrc }|.
    ENDIF.
  ENDMETHOD.

  METHOD get_warehouses.
    DATA rt_return TYPE ty_warehouse.

    SELECT FROM zawarehouse2
              FIELDS client, uuid_w, address, longitude,latitude
              INTO  CORRESPONDING FIELDS OF TABLE @rt_return.
    IF sy-subrc = 0.
      rt_warehouse = rt_return.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
