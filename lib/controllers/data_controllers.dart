import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  Future register(
      {String? name,
      String? email,
      int? phone,
      String? city,
      String? state,
      String? country,
      String? password,
      String? cpassword}) async {
    final url = Uri.parse(
        'https://signin-signup-userregistration.herokuapp.com/signup');
    final response = await http.post(url,
        body: json.encode({
          "name": name,
          "email": email,
          "phone": phone,
          "city": city,
          "state": state,
          "country": country,
          "password": password,
          "cpassword": cpassword,
        }),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body) as Map;
  }

  Future login({String? email, String? password}) async {
    final url =
        Uri.parse('https://signin-signup-userregistration.herokuapp.com/login');
    final response = await http.post(url,
        body: json.encode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body) as Map;
  }
}
