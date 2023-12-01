CLASS zcl_delivery_costs_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_delivery_costs_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Step o - Clear ALL tables
    DELETE FROM zawarehouse2.
    DELETE FROM zarates.
    DELETE FROM zaorder2.

    " Step 1 - Create Instance (singleton)
    DATA(mo_route) = lcl_delivery=>create_instance( ).

    " Step 2 - Create System UUID factory
    DATA(system_uuid) = cl_uuid_factory=>create_system_uuid( ).

    " Step 3 - Create Warehouse Table Info
    DATA lt_warehouse TYPE STANDARD TABLE OF zawarehouse.
    TRY.
        lt_warehouse = VALUE #( ( uuid_w    = system_uuid->create_uuid_x16( )
                                  address   = 'Magazynowa 4, 15-399 Białystok, Poland'
                                  longitude = '23.1236834'
                                  latitude  = '53.1149199' ) ).

      CATCH cx_root INTO DATA(exltw).
        out->write( exltw->get_text( ) ).
    ENDTRY.

    " Step 4 - Save warehouse info into DB
    TRY.
        out->write( mo_route->save_warehouses_data_into_db( lt_warehouse ) ).
      CATCH cx_root INTO DATA(exsw).
        out->write( exsw->get_text( ) ).
    ENDTRY.

    " Step 5 - Create Delivery Zones And Rates Table
    DATA lt_rates TYPE STANDARD TABLE OF zarates.
    TRY.
        lt_rates = VALUE #( uom_distance  = 'KM'
                            currency_code = 'PLN'

                            ( uuid_z       = system_uuid->create_uuid_x16( )
                              min_distance = '0'
                              max_distance = '3'
                              del_zone     = 'A'
                              zone_tarif   = '1' )

                            ( uuid_z       = system_uuid->create_uuid_x16( )
                              min_distance = '3'
                              max_distance = '5'
                              del_zone     = 'B'
                              zone_tarif   = '2' )

                            ( uuid_z       = system_uuid->create_uuid_x16( )
                              min_distance = '5'
                              max_distance = '10'
                              del_zone     = 'C'
                              zone_tarif   = '3' )

                            ( uuid_z       = system_uuid->create_uuid_x16( )
                              min_distance = '10'
                              max_distance = '50'
                              del_zone     = 'D'
                              zone_tarif   = '4' ) ).

      CATCH cx_root INTO DATA(exltt).
        out->write( exltt->get_text( ) ).
    ENDTRY.

    " Step 5 - Save Rates Info Into DB
    TRY.
        out->write( mo_route->save_rates_data_into_db( lt_rates ) ).
      CATCH cx_root INTO DATA(exct).
        out->write( exct->get_text( ) ).
    ENDTRY.

    TRY.
        DATA(warehouse) = mo_route->get_warehouses( ).
      CATCH cx_root INTO DATA(exgw).
        out->write( exgw->get_text( ) ).
    ENDTRY.

    " Step 6 - Create Table Of Delivery Points
    DATA lt_orders TYPE STANDARD TABLE OF zaorder2.
    TRY.
        lt_orders = VALUE #(
            uuid_w     = warehouse[ 1 ]-uuid_w
            del_status = 'N'
            uom_distance = 'KM'
            uom_time  = 'MIN'
            currency_code = 'PLN'
            ( cname   = 'Szkoła Podstawowa Nr 1 im. Juliusza Słowackiego w Białymstoku'
              address = 'ul. Juliusza Słowackiego 4 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 5 im. Władysława Broniewskiego w Białymstoku'
              address = 'ul. Kamienna 15 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 6 im. Jarosława Iwaszkiewicza w Białymstoku'
              address = 'ul. Wesoła 11A Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 8 im. Świętego Kazimierza Królewicza w Białymstoku'
              address = 'ul. Jesienna 8 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 9 im. 42 Pułku Piechoty w Białymstoku'
              address = 'ul. Legionowa 7 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 12 im. Zygmunta Glogera w Białymstoku'
              address = 'ul. Komisji Edukacji Narodowej 1A Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 14 im. Kazimierza Pułaskiego Zespół Szkolno - Przedszkolny Nr 2 w Białymstoku'
              address = 'ul. Kazimierza Pułaskiego 25 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 15 im Marii Skłodowskiej-Curie w Białymstoku'
              address = 'ul. Władysława Broniewskiego 1 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 19 im. Mieszka I w Białymstoku '
              address = 'ul. Mieszka I 18 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 21 im. Marszałka Józefa Piłsudskiego w Białymstoku'
              address = 'ul Polowa 7/1 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 22 Zespół Szkół Ogólnokształcących Mistrzostwa Sportowego Nr 1 im. Marii Konopnickiej w Białymstoku'
              address = 'ul. Marii Konopnickiej 3 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 24 z Oddziałami Dwujęzycznymi im. 2 Korpusu Polskich Sił Zbrojnych na Zachodzie w Białymstoku'
              address = 'ul. Antoniuk Fabryczny 5/7 Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 26 im. Stanisława Staszica w Białymstoku'
              address = 'ul. Radzymińska 11  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 28 im. Konstantego Ildefonsa Gałczyńskiego w Białymstoku'
              address = 'ul. Warmińska 55  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 29 im. Synów Pułku Zespół Szkół Ogólnokształcących Mistrzostwa Sportowego Nr 2 w Białymstoku'
              address = 'ul. Promienna 13A   Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 32 im. mjr Henryka Dobrzańskiego ps. „Hubal” Zespół Szkół Ogólnokształcących Mistrzostwa Sportowego Nr 3 „Pietrasze” w Białymstoku'
              address = 'ul. Pietrasze 29   Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 34 im. gen. Józefa Zachariasza Bema w Białymstoku'
              address = 'ul. Pogodna 12  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 37 im. Kazimierza Górskiego w Białymstoku'
              address = 'ul. Jaworowa 8  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 38 im. Wiesława Kazaneckiego Zespół Szkolno - Przedszkolny Nr 4 w Białymstoku'
              address = 'ul. Porzeczkowa 11  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 47 im. Jana Klemensa Branickiego w Białymstoku'
              address = 'ul. Palmowa 28  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 48 im. króla Stefana Batorego Zespół Szkolno - Przedszkolny Nr 5 w Białymstoku'
              address = 'ul. Magnoliowa 13  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) )

            ( cname   = 'Szkoła Podstawowa Nr 52 im. dr Ireny Białówny w Białymstoku'
              address = 'ul. Dojlidy Górne 48  Białystok'
              uuid    = system_uuid->create_uuid_x16( ) ) ).
      CATCH cx_root INTO DATA(extdp).
        out->write( extdp->get_text( ) ).
    ENDTRY.

    " Step 7 - Save Orders Into DB

    TRY.
        out->write( mo_route->save_orders_data_into_db( lt_orders ) ).
      CATCH cx_root INTO DATA(exc).
        out->write( exc->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
