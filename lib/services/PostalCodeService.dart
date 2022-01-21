import '../model/PostalData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PostalCodeService {
  Future<List<PostOffice>> getPostalCode({int pinCode = 422206}) async {
    print(pinCode);
    http.Response response = await http
        .get(Uri.parse("https://api.postalpincode.in/pincode/$pinCode"));
    var decodedCode = json.decode(response.body);
    List<PostOffice> postalCodeList = await decodedCode[0]["PostOffice"]
        .map<PostOffice>((json) => PostOffice.fromJson(json))
        .toList();
    return postalCodeList;
  }
}
