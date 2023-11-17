// with the names of the movie director, the movie stars, the duration of the movie
// and two different ratings of the movie.
import 'package:flutter/material.dart';
import 'MovieData.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("${movie.title} Details"),
          backgroundColor: Colors.black54,
        ),
      body: Container(
      color: Colors.grey,
      child: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15,90, 15, 190),
          padding: const EdgeInsets.fromLTRB(10,10, 10, 10),
          decoration: BoxDecoration(
              color: Colors.amber[300],//const Color.fromRGBO(200, 200, 200, 1),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 8.0,
                color: Colors.amber
              ),
              boxShadow: [BoxShadow(
                color: Colors.white.withOpacity(0.8), // Shadow color
                spreadRadius: 7, // Spread of the shadow
                blurRadius: 5, // Blur of the shadow
                offset: const Offset(0,0), // Offset of the shadow
              )]
          ),
           child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("Director(s):"),
                customTextData("  ${movie.directors}"),
                const SizedBox(height: 10),
                heading("Actor(s):"),
                customTextData("  ${movie.actors}"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    heading("Film duration:"),
                    customTextData("  ${movie.duration}"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    heading("IMDB:"),
                    customTextData("    ${movie.ratingsIMDB}"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    heading("Rotten Tomatoes:"),
                    customTextData("    ${movie.ratingsRottenTomatoes}")
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget customTextData(String string){
    return Text(string,
      textAlign: TextAlign.start,
      style: const TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 24,
          height: 1.6
        ),
      );
  }
  Widget heading(String string){
    return Text(string,
      textAlign: TextAlign.start,
      style: const TextStyle(
          decoration: TextDecoration.underline,
          decorationThickness: 2,
          fontWeight: FontWeight.bold,
          fontSize: 24,
          height: 1.5
      ),
    );
  }
}
