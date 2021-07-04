import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://192.168.1.4:8000/api"; // change to device ip everytime
  var status;
  static var token;

  // data received is a token to pass to in every subsequent***** call
  loginData(String email, String password, String device_name) async {
    String myUrl = "$serverUrl/login";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json'
    }, body: {
      "email": email,
      "password": password,
      "device_name": device_name
    });
    String jsonsDataString = response.body
        .toString(); // toString of Response's body is assigned to jsonDataString
    var data = jsonDecode(jsonsDataString);
    if (response.statusCode != 200) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["plainTextToken"]}');
      token = data["plainTextToken"];
      print('token: ' + token);
      // viewprofileData(11);
      // destroyprofileData(11);
    }
  }

  registerData(
      String type,
      String email,
      String password,
      String username,
      String gender,
      String country,
      String bOD,
      String f_name,
      String l_name) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json'
    }, body: {
      "type": type,
      "email": email,
      "password": password,
      "username": username,
      "gender": gender,
      "country": country,
      "bOD": bOD,
      "f_name": f_name,
      "l_name": l_name
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["message"]}');
      // token = data["plainTextToken"];
    }
  }

  updateprofileData(
      int id, // ensure that this id is <<<only>>> the id of the logged in user
      String type,
      String email,
      String password,
      String username,
      String gender,
      String country,
      String bOD,
      String ban,
      String creationDate,
      String f_name,
      String l_name,
      String image,
      String about) async {
    String myUrl = "$serverUrl/updateprofile/id=$id";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      "type": type,
      "email": email,
      "password": password,
      "username": username,
      "gender": gender,
      "country": country,
      "bOD": bOD,
      "ban": ban, // if not banned give this an empty value: ""
      "creationDate": creationDate,
      "f_name": f_name,
      "l_name": l_name,
      "image": image,
      "about": about
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  viewprofileData(int id) async {
    String myUrl = "$serverUrl/viewprofile/id=$id";
    final response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    // print('token: $token');
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["account"]}');
    }
  }

  destroyprofileData(int id) async {
    String myUrl = "$serverUrl/destroyprofile/id=$id";
    final response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  createevent(
      String time,
      String title,
      String place,
      String description
      ) async {
    String myUrl = "$serverUrl/createevent";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }, body: {
      "time": time,
      "title": title,
      "place": place,
      "description": description
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["message"]}');
    }
  }

  getOngoingEvents( ) async {
    String myUrl = "$serverUrl/getOngoingEvents";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["events"]}');
    }
  }

  eventview(int id) async {
    String myUrl = "$serverUrl/eventview/id=$id";
    final response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["participants"]}');
    }
  }

  deleteevent(int id) async {
    String myUrl = "$serverUrl/deleteevent/id=$id";
    final response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["message"]}');
    }
  }

  eventparticipate(String eventID) async {
    String myUrl = "$serverUrl/eventparticipate";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }, body: {
      "eventID": eventID
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["message"]}');
    }
  }

  eventleave(String eventID) async {
    String myUrl = "$serverUrl/eventleave";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }, body: {
      "eventID": eventID
    });
    String jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('data error : ${data["error"]}');
    } else {
      print('data : ${data["message"]}');
    }
  }

  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/-----/";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return json.decode(response.body);
  }

  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/------/$id";
    http.delete(myUrl, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
      'Authorization': 'Bearer $token'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData(String name, String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/products";
    http.post(myUrl, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$name",
      "price": "$price"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void editData(int id, String name, String price) async {
    final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;
    String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
    http.put(myUrl, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value'
      'Authorization': 'Bearer $token'
    }, body: {
      "name": "$name",
      "price": "$price"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
