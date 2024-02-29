CLASS lhc_Supplement DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalSuppPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Supplement~calculateTotalSuppPrice.

ENDCLASS.

CLASS lhc_Supplement IMPLEMENTATION.

  METHOD calculateTotalSuppPrice.

  IF NOT keys IS INITIAL.
      zcl_aux_travel_det_a05=>calculate_price( it_travel_id =
                                                              VALUE #( FOR GROUPS <booking_suppl> OF booking_key IN keys
                                                              GROUP BY booking_key-travel_id WITHOUT MEMBERS ( <booking_suppl> ) ) ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
