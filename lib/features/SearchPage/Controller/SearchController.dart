import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchController1 extends GetxController {
  var isLoading = false.obs; // Observable for loading state
  var searchResults = [].obs;

  // API endpoint and key (replace with your API details)
  final String apiUrl = 'https://api.tvmaze.com/search/shows';

  // Method to search movies based on a query
  void searchMovies(String query) async {
    if (query.isEmpty) return;

    isLoading.value = true; // Start loading
    try {
      final url = Uri.parse('$apiUrl?q=$query'); // Correct query parameter
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the response
        final data = json.decode(response.body);
        searchResults.value = data; // Update the results
      } else {
        // Handle API errors
        Get.snackbar('Error', 'Failed to fetch shows: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or parsing errors
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
