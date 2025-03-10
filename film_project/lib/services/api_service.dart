import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey =
      'fee49051588344cb79d7ef336570d908'; // Ganti dengan API Key TMDB

  // Semua Film (Discover)
  static Future<List<Movie>> getAllMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/discover/movie?api_key=$_apiKey&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal mengambil semua film');
    }
  }

  // Film Trending
  static Future<List<Movie>> fetchTrendingMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/trending/movie/day?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal mengambil film trending');
    }
  }

  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query'),
    );

    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  // Film Populer
  static Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal mengambil film populer');
    }
  }
}
