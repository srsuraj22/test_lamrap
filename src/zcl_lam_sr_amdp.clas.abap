CLASS zcl_lam_sr_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    CLASS-METHODS add_numbers IMPORTING
                    value(a) type i
                    value(b) TYPE i
                  EXPORTING
                    value(res) type i.

    CLASS-METHODS get_customer_data IMPORTING
                    value(iv_id) type zlam_sr_dte_id
                  EXPORTING
                    value(res) type char80.

    CLASS-METHODS get_product_mrp IMPORTING
                    VALUE(i_tax) type i
                                  EXPORTING
                    VALUE(otab) type ZLAM_SR_tt_product_mrp.

    CLASS-METHODS get_total_sales for table FUNCTION ZLAM_SR_TF.

    CLASS-METHODS execute FOR SCALAR FUNCTION ZLAM_SR_CALC_AREA.
.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAM_SR_AMDP IMPLEMENTATION.


  METHOD add_numbers BY DATABASE PROCEDURE FOR HDB LANGUAGE
  SQLSCRIPT OPTIONS READ-ONLY.

    DECLARE x INTEGER;
    DECLARE y INTEGER;
    x := a;
    y := b;

    res := :x + :y;

  ENDMETHOD.


METHOD execute BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
OPTIONS READ-ONLY.

    result = 3.14 * radius * radius;

  ENDMETHOD.


  METHOD get_customer_data BY DATABASE PROCEDURE FOR HDB LANGUAGE
  SQLSCRIPT OPTIONS READ-ONLY USING ZLAM_SR_bpa.

    select company_name into res from ZLAM_SR_bpa where bp_id = iv_id;

  ENDMETHOD.


  METHOD get_product_mrp BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
                            options read-only
                            USING ZLAM_SR_product.
*       declare variables
        declare lv_Count integer;
        declare i integer;
        declare lv_mrp bigint;
        declare lv_price_d integer;

*       get all the products in a implicit table (like a internal table in abap)
        lt_prod = select * from ZLAM_SR_product;

*       get the record count of the table records
        lv_count := record_count( :lt_prod );

*       loop at each record one by one and calculate the price after discount (dbtable)
        for i in 1..:lv_count do
*       calculate the MRP based on input tax
            lv_price_d := :lt_prod.price[i] * ( 100 - :lt_prod.discount[i] ) / 100;
            lv_mrp := :lv_price_d * ( 100 + :i_tax ) / 100;
*       if the MRP is more than 15k, an additional 10% discount to be applied
            if lv_mrp > 15000 then
                lv_mrp := :lv_mrp * 0.90;
            END IF ;
*       fill the otab for result (like in abap we fill another internal table with data)
            :otab.insert( (
                              :lt_prod.name[i],
                              :lt_prod.category[i],
                              :lt_prod.price[i],
                              :lt_prod.currency[i],
                              :lt_prod.discount[i],
                              :lv_price_d,
                              :lv_mrp
                          ), i );
        END FOR ;

      ENDMETHOD.


  METHOD get_total_sales by DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
                        OPTIONS READ-ONLY
                        USING ZLAM_SR_bpa ZLAM_SR_so_hdr ZLAM_SR_so_item
  .

    return select
            bpa.client,
            bpa.company_name,
            sum( item.amount ) as total_sales,
            item.currency as currency_code,
            RANK ( ) OVER ( order by sum( item.amount ) desc ) as customer_rank
     from ZLAM_SR_bpa as bpa
    INNER join ZLAM_SR_so_hdr as sls
    on bpa.bp_id = sls.buyer
    inner join ZLAM_SR_so_item as item
    on sls.order_id = item.order_id
    group by bpa.client,
            bpa.company_name,
            item.currency ;

  ENDMETHOD.
ENDCLASS.
