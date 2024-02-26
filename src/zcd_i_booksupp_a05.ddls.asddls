@AbapCatalog.sqlViewName: 'ZVW_BOOKSUPP_A05'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption View'
@Metadata.allowExtensions: true
define view ZCD_I_BOOKSUPP_A05
  as select from ztb_booksupp_a05 as BookingSupplement
  association        to parent ZCD_I_BOOKING_A05 as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                    and $projection.booking_id = _Booking.booking_id
  association [1..1] to ZCD_I_TRAVEL_A05         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement        as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText    as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
 key travel_id,
 key booking_id,
 key booking_supplement_id,
     supplement_id,
     @Semantics.amount.currencyCode: 'currency_code'
     price,
     @Semantics.currencyCode: true
     currency_code,
     @Semantics.systemDateTime.lastChangedAt: true
     _Travel.last_changed_at,
     _Booking,
     _Travel,
     _Product,
     _SupplementText
}

