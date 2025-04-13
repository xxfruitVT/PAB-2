import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';
import '../services/api_service.dart';
import 'dart:convert';
import '../services/api_services.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Movie> _favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteMovies();
  }

  void _loadFavoriteMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favorites') ?? [];
    List<Movie> favs = [];
    for (var id in favIds) {
      final jsonStr = prefs.getString('movie_$id');
      if (jsonStr != null) {
        final movie = Movie.fromJson(jsonDecode(jsonStr));
        favs.add(movie);
      }
    }
    setState(() {
      _favoriteMovies = favs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: _favoriteMovies.length,
        itemBuilder: (context, i) {
          final m = _favoriteMovies[i];
          return ListTile(
            leading: Image.network('${ApiService.imageBase}${m.posterPath}',
                width: 50),
            title: Text(m.title),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => DetailScreen(movie: m))),
          );
        },
      ),
    );
  }
}
