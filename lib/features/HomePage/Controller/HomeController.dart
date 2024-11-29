import 'package:get/get.dart';
import '../../../constants/urlApi.dart';
import '../../../models/movie_model.dart';


class HomeController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var movieList = await ApiService.fetchMovies('all');
      movies.value = movieList.map((json) => Movie.fromJson(json)).toList();
    } finally {
      isLoading(false);
    }
  }
}
