import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';
import '../services/api_service.dart';
import 'dart:convert';

import '../services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({required this.movie});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIsFavorite();
  }

  void _checkIsFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];
    setState(() {
      _isFavorite = favList.contains(widget.movie.id.toString());
    });
  }

  void _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];

    if (_isFavorite) {
      favList.remove(widget.movie.id.toString());
      prefs.remove('movie_${widget.movie.id}');
    } else {
      favList.add(widget.movie.id.toString());
      prefs.setString(
          'movie_${widget.movie.id}', jsonEncode(widget.movie.toJson()));
    }

    await prefs.setStringList('favorites', favList);
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.movie;
    return Scaffold(
      appBar: AppBar(title: Text(m.title)),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(16),
            children: [
              Image.network('${ApiService.imageBase}${m.posterPath}'),
              SizedBox(height: 8),
              Text(m.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Release: ${m.releaseDate}'),
              Text('⭐ ${m.rating}'),
              SizedBox(height: 10),
              Text(m.overview),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: IconButton(
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red, size: 30),
              onPressed: _toggleFavorite,
            ),
          )
        ],
      ),
    );
  }
}
