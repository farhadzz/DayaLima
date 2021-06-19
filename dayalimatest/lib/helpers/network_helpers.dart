import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelpers {
  NetworkHelpers(this.url, {this.headers, this.body});

  final String url;
  final dynamic body;
  Map<String, String> headers;

  Future getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      String dataJson;
      response.statusCode == 200
          ? dataJson = response.body
          : print("${response.statusCode}, ${response.body}");
      return jsonDecode(dataJson);
    } catch (e) {
      print(e);
      throw "Koneksi Error";
    }
  }
}