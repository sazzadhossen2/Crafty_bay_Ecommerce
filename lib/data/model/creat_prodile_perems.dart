class CreatProfilePerams {
  CreatProfilePerams({
    required this.cusAdd,
    required this.cusName,
    required  this.cusCity,
    required this.cusState,
    required  this.cusPostcode,
    required this.cusCountry,
    required this.cusPhone,
    required this.cusFax,
    required this.shipName,
    required this.shipAdd,
    required  this.shipCity,
    required  this.shipState,
    required this.shipPostcode,
    required  this.shipCountry,
    required  this.shipPhone,

    // required this.firstName,
    // required this.lastName,
    // required this.mobile,
    // required this.city,
    // required this.shippingAddress
  });
//
// final String firstName;
// final String lastName;
// final String mobile;
// final String city;
// final String shippingAddress;





  final String  cusName;
  final String cusAdd;
  final String cusCity;
  final String   cusState;
  final String   cusPostcode;
  final String   cusCountry;
  final String   cusPhone;
  final String cusFax;
  final String   shipName;
  final String   shipAdd;
  final String   shipCity;
  final String   shipState;
  final String shipPostcode;
  final String   shipCountry;
  final String   shipPhone;


  Map<String, dynamic> toJson ()=> {
    // "firstName": firstName,
    // "lastName": lastName,
    // "mobile": mobile,
    // "city": city,
    // "shippingAddress": shippingAddress,



    "cus_name": cusName,
    "cus_add": cusAdd,
    "cus_city": cusCity,
    "cus_state":cusState,
    "cus_postcode":cusPostcode,
    "cus_country": cusCountry,
    "cus_phone": cusPhone,
    "cus_fax": cusFax,
    "ship_name": shipName,
    "ship_add": shipAdd,
    "ship_city":shipCity,
    "ship_state": shipState,
    "ship_postcode": shipPostcode,
    "ship_country": shipCountry,
    "ship_phone": shipPhone

  };
}