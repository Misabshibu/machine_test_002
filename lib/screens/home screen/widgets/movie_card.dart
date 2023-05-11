import 'package:flutter/material.dart';
import 'package:machine_test_login/api/data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final MovieData movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: size.width,
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#Rank ${movie.rank}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                'Year : ${movie.year}',
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: size.height * 0.15,
                width: size.width * 0.4,
                child: Image.network(
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.1,
                child: Text(
                  movie.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Directors: ${movie.director[0]}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Writers:${movie.writers}',
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              InkWell(
                onTap: () {
                  _launchUrl(trailer: movie.trailer);
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.play_circle_fill_outlined),
                        Text(
                          'Watch Trailer',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //function launc url
  Future<void> _launchUrl({required String trailer}) async {
    final Uri url = Uri.parse(trailer);
    await Future.delayed(const Duration(seconds: 1));
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
