import 'package:flutter/material.dart';
import 'MovieData.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  const MoviePage({super.key, required this.movie });

  Future<void> _launchIMDB() async {
    if (!await launchUrlString(movie.imdbLink, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${movie.imdbLink}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black54,
      ),

      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 3.0,
            ),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.4), // Shadow color
              spreadRadius: 2, // Spread of the shadow
              blurRadius: 5, // Blur of the shadow
              offset: const Offset(3, 1), // Offset of the shadow
            )]
        ),
        margin: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            _launchIMDB();
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Set the border radius here
              child: movie.image
          ),
            ),
          ),
    );
  }
}
