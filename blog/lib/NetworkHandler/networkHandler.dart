import 'dart:convert';

import 'package:http/http.dart' as http;

class Networkhandler {
  Future<dynamic> post(Map<String, String> body) async {
    var url = Uri.parse(
      'http://192.168.43.28:5000/user/register',
    );
    try {
      var response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode(body));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future login(Map<String, dynamic> body) async {
    var url = Uri.parse(
      'http://192.168.43.28:5000/user/login',
    );
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response;
  }
}
