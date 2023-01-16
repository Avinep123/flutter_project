import 'dart:convert';
import 'dart:io';
import 'package:simple_app/models/getposts.dart';
import 'package:simple_app/models/loginmodel.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('http://mark.bslmeiyu.com/api/getplaces');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var body = response.body;
      return postFromJson(body);
    }
    //  else{
    //    return [];
    //  }
  }

  Future<Login> getLogin({
    var phone,
    var password,
  }) async {
    var client = http.Client();
    var loginmodel;

    var uri = Uri.parse(
        'http://103.38.197.18/mobilebanking/api/v2/mdabaliReportUserLogin');
    var response = await client.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(
        <dynamic, dynamic>{"mobileno": phone, "password": password},
      ),
    );

    if (response.statusCode == 200) {
      var body = response.body;
      var jsonMap = jsonDecode(body);
      loginmodel = Login.fromJson(jsonMap);
    }
    return loginmodel;
  }
}
