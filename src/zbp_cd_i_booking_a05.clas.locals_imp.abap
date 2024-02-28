CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalFlightPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalFlightPrice.

    METHODS validateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateStatus.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD calculateTotalFlightPrice.
  ENDMETHOD.

  METHOD validateStatus.

    READ ENTITY zcd_i_travel_a05\\Booking
         FIELDS ( booking_status )
         WITH VALUE #( FOR <row_key> IN keys ( %key = <row_key>-%key ) )
         RESULT DATA(lt_booking_result).

    LOOP AT lt_booking_result INTO DATA(ls_booking_result).

      CASE ls_booking_result-booking_status.

        WHEN 'N'. " New
        WHEN 'X'. " Cancelled
        WHEN 'B'. " Booked

        WHEN OTHERS.
          APPEND VALUE #( %key = ls_booking_result-%key ) TO failed-booking.

          APPEND VALUE #( %key = ls_booking_result-%key
                          %msg = new_message(
                                              id       = 'ZMC_TRAVEL_A05'
                                              number   = '007'
                                              severity = if_abap_behv_message=>severity-error
                                              v1       = ls_booking_result-booking_id )
                          %element-booking_status = if_abap_behv=>mk-on ) TO reported-booking.
      ENDCASE.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
