import 'package:flutter/material.dart';

import '../images.dart';
import '../models/film_model.dart';

class MovieInh extends InheritedWidget {
  const MovieInh({Key? key, required this.child})
      : super(key: key, child: child);

  // ignore: overridden_fields, annotate_overrides
  final Widget child;

  static final movies = [
    Movie(
      percent: 23,
      backImg: AppImages.greenEleph16f9,
      mainImg: AppImages.greenEleph,
      title: 'Зелёный Слоник',
      dateOfRelease: '1999 г.',
      description:
          'Тема фильма — отношения между армейскими офицерами в условиях закрытого общества военной части.',
      mainActors: [
        Actor('Alexandr', AppImages.actor),
        Actor('Slava', AppImages.actor),
        Actor('Vera', AppImages.actor)
      ],
    ),
    Movie(
        percent: 40,
        backImg: AppImages.greenEleph16f9,
        mainImg: AppImages.greenEleph,
        title: 'Зелёный Слоник',
        dateOfRelease: '1999 г.',
        description:
            'Тема фильма — отношения между армейскими офицерами в условиях закрытого общества военной части.',
        mainActors: [
          Actor('Alexandr', AppImages.actor),
          Actor('Penis', AppImages.actor)
        ]),
    Movie(
        percent: 10,
        backImg: AppImages.greenEleph16f9,
        mainImg: AppImages.greenEleph,
        title: 'Сосать',
        dateOfRelease: '1999 г.',
        description: 'віфвіф',
        mainActors: []),
  ];

  static MovieInh of(BuildContext context) {
    final MovieInh? result =
        context.dependOnInheritedWidgetOfExactType<MovieInh>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MovieInh oldWidget) {
    return true;
  }
}
