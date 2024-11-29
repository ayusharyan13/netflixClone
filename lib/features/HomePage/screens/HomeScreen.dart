import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/features/SearchPage/screens/SearchScreen.dart';
import '../Controller/HomeController.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "assets/images/homeimg.png",
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight / 2,
          ),
          // Netflix Logo and Search
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Netflix Logo
                Image.asset(
                  "assets/images/logos_netflix-icon.png",
                  fit: BoxFit.cover,
                ),
                // Search Icon
                IconButton(
                  onPressed: () {
                    Get.to(SearchScreen()); // Adjust route if necessary
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
          // Movie List starting halfway through the image
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Positioned(
              top: 1,
              left: 0,
              right: 0,
              bottom: 0,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: controller.movies.length,
                    itemBuilder: (context, index) {
                      final movie = controller.movies[index];
                      return MovieCard(
                        title: movie.title,
                        summary: movie.summary,
                        imageUrl: movie.imageUrl,
                        onTap: () => Get.toNamed(
                          '/details',
                          arguments: {
                            'title': movie.title,
                            'summary': movie.summary,
                            'imageUrl': movie.imageUrl,
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
