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
    DATA(system_uuid) = cl_uuid_factory=>create_system_uuid( ).

        DELETE FROM zawarehouse2.
    DELETE FROM zarates.
    DELETE FROM zaorder2.

  ENDMETHOD.
ENDCLASS.
