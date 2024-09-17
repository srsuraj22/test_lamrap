CLASS zcl_lam_sr_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    data : lv_opr type c VALUE 'D'.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lam_sr_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    case lv_opr.
        when 'R'.

            READ ENTITIES OF ZLAM_SR_TRAVEL
            ENTITY Travel
            FIELDS ( travelid agencyid CustomerId OverallStatus ) WITH
            VALUE #( ( TravelId = '00000010' )
                     ( TravelId = '00000024' )
                     ( TravelId = '009594' )
                   )
            RESULT Data(lt_result)
            FAILED data(lt_failed)
            REPORTED DATA(lt_messages).

            out->write(
              EXPORTING
                data   = lt_result
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).


        when 'C'.

            data(lv_description) = 'Suraj Rocks with RAP'.
            data(lv_agency) = '080016'.
            data(lv_customer) = '000797'.

            MODIFY ENTITIES OF ZLAM_SR_TRAVEL
            ENTITY Travel
            CREATE FIELDS (  AgencyId CurrencyCode BeginDate EndDate Description OverallStatus )
            WITH VALUE #(
                            (
                              %CID = 'SURAJ'
                              TravelId = '00022347'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
                            ( %CID = 'SURAJ-1'
                              TravelId = '00022358'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
                             (
                              %CID = 'SURAJ-2'
                              TravelId = '00010010'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
             )
             MAPPED data(lt_mapped)
             FAILED lt_failed
             REPORTED lt_messages.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

        when 'U'.

            lv_description = 'Wow, That was an update'.
            lv_agency = '080016'.

            MODIFY ENTITIES OF ZLAM_SR_TRAVEL
            ENTITY Travel
            UPDATE FIELDS ( AgencyId Description )
            WITH VALUE #(
                            ( TravelId = '00022347'
                              AgencyId = lv_agency
                              Description = lv_description
                             )
                            ( TravelId = '00022358'
                              AgencyId = lv_agency
                              Description = lv_description
                             )
             )
             MAPPED lt_mapped
             FAILED lt_failed
             REPORTED lt_messages.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

        when 'D'.

        MODIFY ENTITIES OF ZLAM_SR_TRAVEL
            ENTITY Travel
            DELETE FROM VALUE #(
                            ( TravelId = '00022347'
                             )
             )
             MAPPED lt_mapped
             FAILED lt_failed
             REPORTED lt_messages.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

    endcase.

  ENDMETHOD.
ENDCLASS.
