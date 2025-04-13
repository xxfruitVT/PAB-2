import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _apiKey = '6934116b6570331c1b0468f5de0f4f8b';
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBase = 'https://image.tmdb.org/t/p/w500';

  Future<List<Movie>> fetchMovies(String category) async {
    final res =
        await http.get(Uri.parse('$_baseUrl/movie/$category?api_key=$_apiKey'));
    if (res.statusCode == 200) {
      final List results = jsonDecode(res.body)['results'];
      return results.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final res = await http
        .get(Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query'));
    if (res.statusCode == 200) {
      final List results = jsonDecode(res.body)['results'];
      return results.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
