import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/src/Theme/app_colors.dart';
import 'package:the_movie_db/src/stream/app_bar_title/app_bar_title.dart';
import 'movi_widget.dart';
import 'news_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedItem = 0;
  final AppBarBloc _bloc = AppBarBloc();

  void onSelectTab(int index) {
    setState(() {
      if (_selectedItem == index) return;
      _selectedItem = index;
      _bloc.sink.add(_selectedItem);
    });
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: _bloc.stream,
        initialData: 'Новости',
        builder: (context, snapshot) {
          log(snapshot.data ?? 'DATA MISS');
          return Scaffold(
            body: IndexedStack(
              index: _selectedItem,
              children: const [
                NewsWidget(),
                MoviWidget(),
                Text(
                  'Сериалы',
                ),
              ],
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar(
              iconSize: 28,
              gapLocation: GapLocation.none,
              inactiveColor: const Color.fromARGB(255, 121, 121, 121),
              activeColor: Colors.white,
              notchSmoothness: NotchSmoothness.sharpEdge,
              elevation: 0,
              backgroundColor: AppColors.mainDarkBlue,
              activeIndex: _selectedItem,
              icons: const [
                Icons.gradient,
                Icons.movie_creation_outlined,
                Icons.tv_rounded,
              ],
              onTap: onSelectTab,
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text(snapshot.data!),
            ),
          );
        });
  }
}
