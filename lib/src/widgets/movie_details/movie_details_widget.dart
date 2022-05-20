import 'package:flutter/material.dart';

import 'movie_details_widget_main_info.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int id;
  const MovieDetailsWidget({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Зелёный слоник'))),
      body: ColoredBox(
        color: Colors.grey,
        child: ListView(
          children: [
            MovieDetailsWidgetMainInfo(
              id: widget.id,
            )
          ],
        ),
      ),
    );
  }
}
