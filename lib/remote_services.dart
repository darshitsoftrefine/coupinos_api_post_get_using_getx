import 'dart:convert';

import 'package:coupino_api_call_usingget/model/model_coupino.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static var client = http.Client();
    Post? postedDetails;
    List<Post> newdetails = [];

  //static PostedBy? postedDetails;

  Future<List<Post>?> fetchpostDetails() async {
    var response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/post/get'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjMxYWQxNDhlMGEyNjkwMDIzMWJiNTc5IiwiZW1haWwiOiJsZWFybnRlc3Q0MysxQGdtYWlsLmNvbSIsInJvbGUiOlsiUmVndWxhclVzZXIiXSwiZmlyc3ROYW1lIjoiSGFycnkiLCJsYXN0TmFtZSI6IlBvdHRlciIsImlzRGVmYXVsdEltYWdlIjpmYWxzZSwiZGVmYXVsdEltYWdlUGF0aCI6IiIsImlzUmVnaXN0cmF0aW9uQ29tcGxldGUiOnRydWUsImlhdCI6MTY4NDIyOTkzNSwiZXhwIjoxNjg2ODIxOTM1fQ.QZ8SEIejeJVnpWX0lw3-3iTH8w5BKxkkSPtytiqd8NE'
      },
      body: jsonEncode(<String, double>{
        "radius": 10,
        "pageSize": 10,
        "page": 0,
        "longitude": 72.50369833333333,
        "latitude": 23.034296666666666
      }),
    );
    // Map<String, dynamic> myMap = json.decode(response.body);
    // List<dynamic> entitlements = myMap["posts"][0]["postedBy"];
    // entitlements.forEach((entitlement) {
    //   (entitlement as Map<String, dynamic>).forEach((key, value) {
    //     print(key);
    //     (value as Map<String, dynamic>).forEach((key2, value2) {
    //       print(key2);
    //       print(value2);
    //     });
    //   });
    // });
    var data = json.decode(response.body.toString());
    if(response.statusCode == 200){
      for (var i = 0; i < data['posts'].length; i++) {
        postedDetails = Post.fromJson(data['posts'][i]);
        newdetails.add(postedDetails!);
        print(postedDetails!.postedBy.firstName);
      }

        return newdetails;
      } else {
        return newdetails;
      }
  }
}