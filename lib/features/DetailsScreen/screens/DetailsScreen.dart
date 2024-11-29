import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed from the previous screen
    final arguments = Get.arguments;
    final title = arguments['title'];
    final summary = arguments['summary'];
    final imageUrl = arguments['imageUrl'];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageUrl,
                height: 200, // Set a fixed height for consistency
                width: double.infinity, // Use full width
                fit: BoxFit.cover, // Ensure the image scales properly
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              summary,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
