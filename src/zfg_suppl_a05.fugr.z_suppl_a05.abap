FUNCTION z_suppl_a05.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_SUPPLEMENTS) TYPE  ZTT_SUPPL_A05
*"     REFERENCE(LV_OP_TYPE) TYPE  ZDE_FLAG_05
*"  EXPORTING
*"     REFERENCE(EV_UPDATED) TYPE  ZDE_FLAG_05
*"----------------------------------------------------------------------
  CHECK NOT it_supplements IS INITIAL.

  CASE lv_op_type.

    WHEN 'C'.
      INSERT ztb_booksupp_a05 FROM TABLE @it_supplements.

    WHEN 'U'.
      UPDATE ztb_booksupp_a05 FROM TABLE @it_supplements.

    WHEN 'D'.
      DELETE ztb_booksupp_a05 FROM TABLE @it_supplements.

  ENDCASE.

  IF sy-subrc EQ 0.

    ev_updated = abap_true.

  ENDIF.

ENDFUNCTION.
