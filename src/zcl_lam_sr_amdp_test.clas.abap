CLASS zcl_lam_sr_amdp_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAM_SR_AMDP_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*   zcl_lam_sr_amdp=>add_numbers(
*      EXPORTING
*        a   = 30
*        b   = 20
*      IMPORTING
*        res = data(lv_data)
*    ).


*    zcl_lam_ab_amdp=>get_customer_data(
*      EXPORTING
*        iv_id = '8E04297ED00D1EEF968EE2F534387DF7'
*      IMPORTING
*        res   = data(lv_data)
*    ).
*
*    out->write(
*      EXPORTING
*        data   = lv_data
**        name   =
**      RECEIVING
**        output =
*    ).

*zcl_lam_ab_amdp=>get_product_mrp(
*      EXPORTING
*        i_tax = 18
*      IMPORTING
*        otab  = data(itab)
*    ).
*
*    out->write(
*      EXPORTING
*        data   = itab
**        name   =
**      RECEIVING
**        output =
*    ).



  ENDMETHOD.
ENDCLASS.
