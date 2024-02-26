@AbapCatalog.sqlViewName: 'ZVW_I_BOOK_A05'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking View'
@Metadata.allowExtensions: true
define view ZCD_I_BOOKING_A05
  as select from ztb_booking_a05 as Booking
  association        to parent ZCD_I_TRAVEL_A05 as _Travel     on  $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZCD_I_BOOKSUPP_A05      as _BookSupplement
  association [1..1] to /DMO/I_Customer         as _Customer   on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier          as _Carrier    on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection       as _Connection on  $projection.carrier_id    = _Connection.AirlineID
                                                               and $projection.connection_id = _Connection.ConnectionID
{
      //Booking
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,
      /* Associations */
      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection
}
