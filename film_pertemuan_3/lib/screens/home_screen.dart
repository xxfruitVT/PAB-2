import 'package:film_pertemuan_3/models/movie.dart';
import 'package:film_pertemuan_3/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();
  List<Movie> _allMovies = [];
  List<Movie> _popularMoviss = [];
  List<Movie> _trendingMovies = [];

  Future<void> _loadMovie() async {
    final List<Map<String, dynamic>> allMovieData =
        await _apiServices.getAllMovie();
    final List<Map<String, dynamic>> trendingMovieData =
        await _apiServices.getTrendingMovies();
    final List<Map<String, dynamic>> popularMovieData =
        await _apiServices.getPopularMovies();

    setState(() {
      _allMovies = allMovieData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovies =
          trendingMovieData.map((e) => Movie.fromJson(e)).toList();
      _popularMoviss = popularMovieData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Film")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text("All Movies")),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: _allMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  final Movie movie = _allMovies[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Text(
                          movie.title.length > 14
                              ? '${movie.title.substring(0, 10)}...'
                              : movie.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
