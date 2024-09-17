CLASS zcl_lam_sr_mission_mars DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    data: itab type table of string.
    INTERFACES if_oo_adt_classrun .
    methods reach_to_mars.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lam_sr_mission_mars IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    me->reach_to_mars(  ).

    out->write(
          EXPORTING
            data   = itab
*            name   =
*          RECEIVING
*            output =
        ).

  ENDMETHOD.
  METHOD reach_to_mars.
    data lv_text type string.

    data(lo_earth) = new zcl_earth( ).
    data(lo_iplanet1) = new zcl_planet1(  ).
    data(lo_mars) = new zcl_mars( ).

    lv_text = lo_earth->start_engine( ).
    append lv_text to itab.
    lv_text = lo_earth->leave_orbit(  ).
    append lv_text to itab.

    lv_text = lo_iplanet1->enter_orbit( ).
    append lv_text to itab.
    lv_text = lo_iplanet1->leave_orbit(  ).
    append lv_text to itab.

    lv_text = lo_mars->enter_orbit( ).
    append lv_text to itab.
    lv_text = lo_mars->explore_mars( ).
    append lv_text to itab.


  ENDMETHOD.
ENDCLASS.
