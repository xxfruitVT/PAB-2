import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie.dart';
import '../services/api_services.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilem - Populer')),
      body: FutureBuilder<List<Movie>>(
        future: apiService.fetchMovies('popular'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, i) {
              final m = movies[i];
              return ListTile(
                leading: Image.network('${ApiService.imageBase}${m.posterPath}',
                    width: 50),
                title: Text(m.title),
                subtitle: Text('⭐ ${m.rating}'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DetailScreen(movie: m))),
              );
            },
          );
        },
      ),
    );
  }
}
