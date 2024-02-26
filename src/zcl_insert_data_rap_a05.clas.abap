CLASS zcl_insert_data_rap_a05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_rap_a05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_travel   TYPE TABLE OF ztb_travel_a05,
          lt_booking  TYPE TABLE OF ztb_booking_a05,
          lt_book_sup TYPE TABLE OF ztb_booksupp_a05.
    SELECT travel_id, agency_id, customer_id, begin_date,
    end_date,
    booking_fee, total_price, currency_code, description,
    status AS overall_status, createdby AS created_by,
    createdat AS created_at, lastchangedby AS
    last_changed_by,
    lastchangedat AS last_changed_at
    FROM /dmo/travel INTO CORRESPONDING FIELDS OF TABLE
    @lt_travel
    UP TO 15 ROWS.
    SELECT * FROM /dmo/booking INTO CORRESPONDING FIELDS OF
    TABLE @lt_booking.
    SELECT * FROM /dmo/book_suppl INTO CORRESPONDING FIELDS OF
    TABLE @lt_book_sup.
    DELETE FROM: ztb_travel_a05,
    ztb_booking_a05,
    ztb_booksupp_a05.
    INSERT:
    ztb_travel_a05 FROM TABLE @lt_travel,
    ztb_booking_a05 FROM TABLE @lt_booking,
    ztb_booksupp_a05 FROM TABLE @lt_book_sup.
    out->write( sy-dbcnt ).
    out->write( 'DONE!' ).
  ENDMETHOD.
ENDCLASS.
