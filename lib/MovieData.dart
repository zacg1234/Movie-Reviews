import 'package:flutter/material.dart';

//class MovieData {
  class Movie {
  final String title;
  final String actors;
  final String directors;
  final String duration;
  final String ratingsIMDB;
  final String ratingsRottenTomatoes;
  final String imdbLink;
  final String wikipediaLink;
  final Image image;

  Movie({
  required this.title,
  required this.actors,
  required this.directors,
  required this.duration,
  required this.ratingsIMDB,
  required this.ratingsRottenTomatoes,
  required this.imdbLink,
  required this.wikipediaLink,
  required this.image,
  });
  }

  class MovieData {
  // Comedies
    static List<Movie> comedyMovies = [
    Movie(
      title: 'Dumb and Dumber',
      actors: 'Jim Carrey, Jeff Daniels',
      directors: 'Peter Farrelly, Bobby Farrelly',
      duration: '107 min',
      ratingsIMDB: '7.3/10',
      ratingsRottenTomatoes: '67%',
      imdbLink: 'https://www.imdb.com/title/tt0109686/',
      wikipediaLink: 'https://en.wikipedia.org/wiki/Dumb_and_Dumber',
      image: Image.asset('assets/DumbAndDumber.jpg'),
    ),
    Movie(
      title: 'The Grand Budapest Hotel',
      actors: 'Ralph Fiennes, Tony Revolori',
      directors: 'Wes Anderson',
      duration: '99 min',
      ratingsIMDB: '8.1/10',
      ratingsRottenTomatoes: '92%',
      imdbLink: 'https://www.imdb.com/title/tt2278388/',
      wikipediaLink:
      'https://en.wikipedia.org/wiki/The_Grand_Budapest_Hotel',
      image: Image.asset('assets/GrandBudapest.jpg'),
    ),
    Movie(
      title: 'Superbad',
      actors: 'Jonah Hill, Michael Cera',
      directors: 'Greg Mottola',
      duration: '113 min',
      ratingsIMDB: '7.6/10',
      ratingsRottenTomatoes: '88%',
      imdbLink: 'https://www.imdb.com/title/tt0829482/',
      wikipediaLink: 'https://en.wikipedia.org/wiki/Superbad_(film)',
      image: Image.asset('assets/Superbad.jpg'),
    ),
    Movie(
      title: 'Anchorman: The Legend of Ron Burgundy',
      actors: 'Will Ferrell, Christina Applegate',
      directors: 'Adam McKay',
      duration: '94 min',
      ratingsIMDB: '7.2/10',
      ratingsRottenTomatoes: '66%',
      imdbLink: 'https://www.imdb.com/title/tt0357413/',
      wikipediaLink:
      'https://en.wikipedia.org/wiki/Anchorman:_The_Legend_of_Ron_Burgundy',
      image: Image.asset('assets/Anchorman.jpg'),
    ),
    ];

    static List<Movie> actionMovies = [
      Movie(
        title: 'The Dark Knight',
        actors: 'Christian Bale, Heath Ledger',
        directors: 'Christopher Nolan',
        duration: '152 min',
        ratingsIMDB: '9.0/10',
        ratingsRottenTomatoes: '94%',
        imdbLink: 'https://www.imdb.com/title/tt0468569/',
        wikipediaLink:
        'https://en.wikipedia.org/wiki/The_Dark_Knight_(film)',
        image: Image.asset('assets/DarkKnight.jpg'),
      ),
      Movie(
        title: 'Die Hard',
        actors: 'Bruce Willis',
        directors: 'John McTiernan',
        duration: '132 min',
        ratingsIMDB: '8.2/10',
        ratingsRottenTomatoes: '93%',
        imdbLink: 'https://www.imdb.com/title/tt0095016/',
        wikipediaLink: 'https://en.wikipedia.org/wiki/Die_Hard',
        image: Image.asset('assets/DieHard.jpg'),
      ),
      Movie(
        title: 'Inception',
        actors: 'Leonardo DiCaprio, Joseph Gordon-Levitt',
        directors: 'Christopher Nolan',
        duration: '148 min',
        ratingsIMDB: '8.8/10',
        ratingsRottenTomatoes: '87%',
        imdbLink: 'https://www.imdb.com/title/tt1375666/',
        wikipediaLink: 'https://en.wikipedia.org/wiki/Inception',
        image: Image.asset('assets/Inception.jpg'),
      ),
      Movie(
        title: 'Mad Max: Fury Road',
        actors: 'Tom Hardy, Charlize Theron',
        directors: 'George Miller',
        duration: '120 min',
        ratingsIMDB: '8.1/10',
        ratingsRottenTomatoes: '97%',
        imdbLink: 'https://www.imdb.com/title/tt1392190/',
        wikipediaLink:
        'https://en.wikipedia.org/wiki/Mad_Max:_Fury_Road',
        image: Image.asset('assets/MadMax.jpg'),
      ),
    ];

    static List<Movie> romanceMovies = [
      Movie(
        title: 'Eternal Sunshine of the Spotless Mind',
        actors: 'Jim Carrey, Kate Winslet',
        directors: 'Michel Gondry',
        duration: '108 min',
        ratingsIMDB: '8.3/10',
        ratingsRottenTomatoes: '93%',
        imdbLink: 'https://www.imdb.com/title/tt0338013/',
        wikipediaLink:
        'https://en.wikipedia.org/wiki/Eternal_Sunshine_of_the_Spotless_Mind',
        image: Image.asset('assets/EternalSunshine.jpg'),
      ),
      Movie(
        title: 'The Notebook',
        actors: 'Ryan Gosling, Rachel McAdams',
        directors: 'Nick Cassavetes',
        duration: '123 min',
        ratingsIMDB: '7.8/10',
        ratingsRottenTomatoes: '53%',
        imdbLink: 'https://www.imdb.com/title/tt0332280/',
        wikipediaLink: 'https://en.wikipedia.org/wiki/The_Notebook',
        image: Image.asset('assets/Notebook.jpg'),
      ),
      Movie(
        title: 'Before Sunrise',
        actors: 'Ethan Hawke, Julie Delpy',
        directors: 'Richard Linklater',
        duration: '101 min',
        ratingsIMDB: '8.1/10',
        ratingsRottenTomatoes: '100%',
        imdbLink: 'https://www.imdb.com/title/tt0112471/',
        wikipediaLink: 'https://en.wikipedia.org/wiki/Before_Sunrise',
        image: Image.asset('assets/BeforeSunrise.jpg'),
      ),
      Movie(
        title: 'Pride and Prejudice',
        actors: 'Keira Knightley, Matthew Macfadyen',
        directors: 'Joe Wright',
        duration: '129 min',
        ratingsIMDB: '7.8/10',
        ratingsRottenTomatoes: '85%',
        imdbLink: 'https://www.imdb.com/title/tt0414387/',
        wikipediaLink:
        'https://en.wikipedia.org/wiki/Pride_%26_Prejudice_(2005_film)',
        image: Image.asset('assets/PrideAndPrejudice.jpg'),
      ),
    ];
  }

