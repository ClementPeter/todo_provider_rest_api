import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_provider_rest_api/constants/constants.dart';
import 'package:todo_provider_rest_api/providers/database/database_provider.dart';

class GetUserTask {
  DatabaseProvider databaseProvider = DatabaseProvider();
  final url = AppUrl.baseUrl;

  Future getTask() async {
    final userId = databaseProvider.getUserId();
    final token = databaseProvider.getToken();

    String _url = "$url/users/$userId/tasks?lastId=&pagination=20";

    try {
      final request = await http
          .get(Uri.parse(_url), headers: {'Authorization': 'Bearer $token'});

      print(request.statusCode);

      if (request.statusCode == 200 || request.statusCode == 201) {
        print(request.body);       
      }
    } catch (e) {
      print(e); 
      return Future.error(e.toString());
    }
  }
}
