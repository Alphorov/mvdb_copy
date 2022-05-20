import 'package:flutter/material.dart';

import '../../images.dart';
import '../../inherited/movie_inh.dart';
import '../../models/film_model.dart';
import '../percent/radial_percent.dart';
import 'screen_cast_widget.dart';

class MovieDetailsWidgetMainInfo extends StatelessWidget {
  MovieDetailsWidgetMainInfo({Key? key, required this.id}) : super(key: key);
  final int id;
  final List<Movie> _movies = MovieInh.movies;

  @override
  Widget build(BuildContext context) {
    final Movie _movie = _movies[id];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(image: _movie.backImg),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _Score(
          core: _movie.percent,
        ),
        const _SummeryWidget(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Обзор',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(_movie.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
        ),
        ScreenCastWidget(
          actors: _movie.mainActors,
        )
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key, required this.image}) : super(key: key);
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            height: 185,
            width: double.infinity,
            child: Image(fit: BoxFit.fill, image: image),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Image(width: 96, image: AppImages.greenEleph))
        ],
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: TextSpan(children: [
          const TextSpan(
              text: 'Зелёный Слоник',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          TextSpan(
            text: ' (1999)',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.8),
            ),
          )
        ]));
  }
}

class _Score extends StatefulWidget {
  const _Score({Key? key, required this.core}) : super(key: key);
  final int core;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<_Score> {
  static const textStyle =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Row(
        children: [
          Some(
            core: widget.core,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: TextButton(
                onPressed: () {},
                child: const Text('Пользовательский счет',
                    maxLines: 2, style: textStyle)),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            width: 1,
            color: Colors.black,
            height: 40,
          ),
          const SizedBox(
            width: 12,
          ),
          const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: TextButton(
                onPressed: () {},
                child: const Text('Воспроизвести трейлер',
                    maxLines: 2, style: textStyle)),
          ),
        ],
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(28, 30, 26, 1),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
          child: Text(
            '|PG-13| 01/01/1999 (US) 1h 27m драма, триллер, ужасы, комедия',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9)),
          ),
        ),
      ),
    );
  }
}
