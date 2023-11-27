CLASS zcl_delivery_costs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_delivery_costs IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Step 1 - Create Instance (singleton)
    DATA(mo_route) = lcl_delivery=>create_instance( ).

    " Step 2 - Create System UUID factory
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(system_uuid) = cl_uuid_factory=>create_system_uuid( ).

    " Step 3 - Update Orders Data

    TRY.
        out->write( mo_route->update_orders_data( mo_route->get_orders( ) ) ).
      CATCH cx_root INTO DATA(exc).
        out->write( exc->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
