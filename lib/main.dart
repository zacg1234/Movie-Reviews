import 'package:flutter/material.dart';
import 'package:movie_reviews/DetailsPage.dart';
import 'MovieData.dart';
import 'MoviePage.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Reviews',
      theme: ThemeData(),
      home: const MyList(),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyList createState() => _MyList();
}

class _MyList extends State<MyList> {
  late Offset _tapPosition;

  @override
  void initState() {
    super.initState();
    _tapPosition = const Offset(0.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text("Top Movies"),
          backgroundColor: Colors.black54,
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          children: [
            const Text("Comedy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            genreMovieList(context, 'comedy'),
            const Text("Action",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            genreMovieList(context, 'action'),
            const Text("Romance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            genreMovieList(context, 'romance')
          ],
        ));
  }

  Widget genreMovieList(BuildContext context, String genre) {
    return Container(
      height: 300,
      child: ListView.separated(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return movie(context, index, genre);
        },
        separatorBuilder: (BuildContext context, int position) {
          return const SizedBox(height: 0, width: 10);
        },
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }

  Widget movie(BuildContext context, int position, String genre) {
    List<Movie> listOfMoviesByGenre;

    if (genre == 'comedy') {
      listOfMoviesByGenre = MovieData.comedyMovies;
    } else if (genre == 'action') {
      listOfMoviesByGenre = MovieData.actionMovies;
    } else {
      listOfMoviesByGenre = MovieData.romanceMovies;
    }
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MoviePage(
                      movie: listOfMoviesByGenre[position],
                    )),
          );
        },
        onTapDown: (TapDownDetails details) {
          _storePosition(details);
        },
        onLongPress: () {
          _showPopupMenu(listOfMoviesByGenre[position]);
        },
        child: movieCard(listOfMoviesByGenre[position]));
  }

  Widget movieCard(Movie movie) {
    return Container(
        width: 340,
        height: 10,
        padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 1, child:  Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.4), // Shadow color
                  spreadRadius: 1, // Spread of the shadow
                  blurRadius: 3, // Blur of the shadow
                  offset: const Offset(3, 1), // Offset of the shadow
                )],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black, // Set the border color
                  width: 3.0, // Set the border width
                ),
              ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: movie.image,
                ),
              ),
              ),
            const SizedBox(width: 10,),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.start,
                    ),
                    Text(movie.actors,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic
                        )
                    )
                  ],
                ))
          ],
        ));
  }

  Future<void> _launchBrowser(String url) async {
    if (!await launchUrlString(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  _showPopupMenu(Movie movie) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          _tapPosition & const Size(40, 40), // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
          ),
      items: [
        const PopupMenuItem(
          value: 0,
          child: Text("Details"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("Wikipedia"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("IMDB"),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(
                  movie: movie,
                )
            ));
      }
      if (value == 1) {
        _launchBrowser(movie.wikipediaLink);
      }
      if (value == 2) {
        _launchBrowser(movie.imdbLink);
      }
    });
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }
}
