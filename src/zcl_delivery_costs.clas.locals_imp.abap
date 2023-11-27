CLASS lcl_delivery DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    TYPES ty_orders    TYPE STANDARD TABLE OF zaorder2     WITH KEY uuid uuid_w.
    TYPES ty_warehouse TYPE STANDARD TABLE OF zawarehouse2 WITH KEY uuid_w.
    TYPES ty_tarif     TYPE STANDARD TABLE OF zarates      WITH KEY min_distance max_distance.

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
ENDCLASS.
