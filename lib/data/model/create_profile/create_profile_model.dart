// class CreateProfileModel {
//   String? cusName;
//   String? cusAdd;
//   String? cusCity;
//   String? cusState;
//   String? cusPostcode;
//   String? cusCountry;
//   String? cusPhone;
//   String? cusFax;
//   String? shipName;
//   String? shipAdd;
//   String? shipCity;
//   String? shipState;
//   String? shipPostcode;
//   String? shipCountry;
//   String? shipPhone;
//
//   CreateProfileModel({this.cusName,
//     this.cusAdd,
//     this.cusCity,
//     this.cusState,
//     this.cusPostcode,
//     this.cusCountry,
//     this.cusPhone,
//     this.cusFax,
//     this.shipName,
//     this.shipAdd,
//     this.shipCity,
//     this.shipState,
//     this.shipPostcode,
//     this.shipCountry,
//     this.shipPhone});
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       'cus_name': cusName,
//       'cus_add': cusAdd,
//       'cus_city': cusCity,
//       'cus_state': cusState,
//       'cus_postcode': cusPostcode,
//       'cus_country': cusCountry,
//       'cus_phone': cusPhone,
//       'cus_fax': cusFax,
//       'ship_name': shipName,
//       'ship_add': shipAdd,
//       'ship_city': shipCity,
//       'ship_state': shipState,
//       'ship_postcode': shipPostcode,
//       'ship_country': shipCountry,
//       'ship_phone': shipPhone,
//
//     };
//   }
// }



// class CreateProfileModel {
//   String? msg;
//   CreateProfile? data;
//
//   CreateProfileModel({this.msg, this.data});
//
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }


