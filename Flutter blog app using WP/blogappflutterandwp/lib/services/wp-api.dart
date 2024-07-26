import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchwpPosts() async {
  final response = await http.get(
    Uri.parse("http://flutterblog1234.free.nf/wp-json/wp/v2/posts"),
    headers: {"Accept": "application/json"},
  );

  var convetedDatatojson = jsonDecode(response.body);
  return convetedDatatojson;
}
