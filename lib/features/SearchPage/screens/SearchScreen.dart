import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/SearchController.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController1 controller = Get.put(SearchController1());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onSubmitted: (value) => controller.searchMovies(value),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.searchResults.isEmpty) {
                return const Center(child: Text('No results found.'));
              }
              return ListView.builder(
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  final movie = controller.searchResults[index];
                  final title = movie['show']['name'] ?? 'No Title';
                  final summary = movie['show']['summary'] ?? 'No summary available.';
                  final imageUrl = movie['show']['image']?['original'] ??
                      'https://via.placeholder.com/150';

                  return ListTile(
                    leading: Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                    ),
                    title: Text(title),
                    subtitle: Text(
                      summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // onTap: () {
                    //   Get.toNamed(
                    //     '/details',
                    //     arguments: {
                    //       'title': movie.title,
                    //       'summary': movie.summary,
                    //       'imageUrl': movie.imageUrl,
                    //     },
                    //   );
                    // },
                    onTap: () {
                      Get.toNamed(
                        '/details',
                        arguments: {
                          'title': movie['show']['name'] ?? 'No Title',
                          'summary': movie['show']['summary'] ?? 'No summary available.',
                          'imageUrl': movie['show']['image']?['original'] ?? 'https://via.placeholder.com/150',
                        },
                      );
                    },

                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
