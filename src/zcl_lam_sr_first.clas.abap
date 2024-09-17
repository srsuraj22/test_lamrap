CLASS zcl_lam_sr_first DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAM_SR_FIRST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write(
      EXPORTING
        data   = 'welcome to abap on cloud amigo!'
*        name   =
*      RECEIVING
*        output =
    ).
  ENDMETHOD.
ENDCLASS.
