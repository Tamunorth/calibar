import 'package:calorie_tracker/src/home/search_res_dto.dart';
import 'package:dio/dio.dart';

class HomeService {
// Replace "YOUR_API_KEY" with your actual USDA API key
  static const String apiKey = "Ch4QNn3NVwjTGwTP6emjlzYJEPxhHMA5kQ8xZmgm";

  Future<List<Foods>> makeFetchData(
    String query,
  ) async {
    // Base URL for the FoodData Central API
    const baseUrl = "https://api.nal.usda.gov/fdc/v1/foods/search";

    // Search parameters
    final queryParams = {
      "query": query,
      "dataType": ["Foundation", "Survey (FNDDS)", "SR Legacy"],
      "pageSize": 25,
      "pageNumber": 1,
      "sortBy": "dataType.keyword",
      "sortOrder": "asc",
      "api_key": apiKey,
      "requireAllWords": "true",
    };

    try {
      // Create a Dio instance
      final dio = Dio();

      // Make the GET request
      final response = await dio.get(baseUrl, queryParameters: queryParams);

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = response.data;

        // Access the data (e.g., list of foods)
        final result = data['foods'];

        final foods =
            (result as List).map((food) => Foods.fromJson(food)).toList();

        // Process the data as needed
        print(foods.length); // Example: print the list of foods

        return foods;
      } else {
        print("Error: ${response.statusCode}");

        return [];
      }
    } on DioError catch (e) {
      print("Error: ${e}");

      rethrow;
    }
  }
}
