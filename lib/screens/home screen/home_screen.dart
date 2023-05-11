import 'package:flutter/material.dart';
import 'package:machine_test_login/api/controller.dart';
import 'package:machine_test_login/api/data_model.dart';
import 'package:machine_test_login/screens/home%20screen/widgets/home_appbar.dart';
import 'package:machine_test_login/screens/home%20screen/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsNetworkServices.fetchMovieDatas();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffcaf0f8),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: HomeAppbar()),
      body: FutureBuilder(
          future: DetailsNetworkServices.fetchMovieDatas(),
          builder: (context, movielist) {
            if (movielist.hasData) {
              return ListView(
                  children: List.generate(movielist.data!.length, (index) {
                final MovieData movie = movielist.data![index];
                return MovieCard(size: size, movie: movie);
              }));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
