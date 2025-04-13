import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie.dart';
import '../services/api_services.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResults = [];

  void _searchMovies() async {
    final query = _searchController.text;
    if (query.isEmpty) return;
    final results = await _apiService.searchMovies(query);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _searchController)),
                IconButton(icon: Icon(Icons.search), onPressed: _searchMovies),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, i) {
                final m = _searchResults[i];
                return ListTile(
                  title: Text(m.title),
                  subtitle: Text('⭐ ${m.rating}'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailScreen(movie: m))),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
