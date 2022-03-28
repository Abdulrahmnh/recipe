import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<List<dynamic>> getUser() async {
    final response = await get('https://recipeappserver.herokuapp.com/getAllRecipes');
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return response.body['recipes'];
    }
  }
}