CLASS zcl_ext_update_ent_a05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ext_update_ent_a05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITIES OF zcd_i_travel_a05
           ENTITY Travel
           UPDATE FIELDS ( agency_id description )
           WITH VALUE #( ( travel_id = '00000005'
                           agency_id = '070014'
                           description = 'New external Update' ) )
           FAILED DATA(failed)
           REPORTED DATA(reported).

    READ ENTITIES OF zcd_i_travel_a05
           ENTITY Travel
           FIELDS ( agency_id description )
           WITH VALUE #( ( travel_id = '00000005' ) )
           RESULT DATA(lt_travel_data)
           FAILED failed
           REPORTED reported.

    COMMIT ENTITIES.


    IF failed IS INITIAL.

      out->write( 'Commit Successfull' ).

    ELSE.

      out->write( 'Commit Failed' ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
