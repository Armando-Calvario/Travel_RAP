@EndUserText.label: 'Booking Supplement Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZCD_C_BOOKSUPP_A05
  as projection on ZCD_I_BOOKSUPP_A05
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
  @ObjectModel.text.element: [ 'SupplementDescription' ]
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      currency_code               as CurrencyCode,
      last_changed_at             as LastChangedAt,
      /* Associations */
      _Travel : redirected to ZCD_C_TRAVEL_A05,
      _Booking : redirected to parent ZCD_C_BOOKING_A05,
      _SupplementText
}
