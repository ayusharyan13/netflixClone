import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String summary;
  final String imageUrl;
  final VoidCallback onTap;

  const MovieCard({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 60, // Set a fixed width for the leading widget
          height: 60, // Set a fixed height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(
          summary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}
