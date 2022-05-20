import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/Theme/app_colors.dart';
import 'src/inherited/movie_inh.dart';
import 'src/widgets/auth/auth_widget.dart';
import 'src/widgets/main_screen/main_screen_wiget.dart';
import 'src/widgets/movie_details/movie_details_widget.dart';

void main() {
  final app = MyApp();
  runApp(app);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieInh(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainDarkBlue,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainDarkBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey),
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/auth':
              return MaterialPageRoute(
                  builder: (context) => const AuthWidget());
            case '/main':
              return MaterialPageRoute(
                  builder: (context) => const MainScreenWidget());
            case '/main/movie_details':
              return MaterialPageRoute(
                  builder: ((context) => MovieDetailsWidget(
                        id: settings.arguments as int,
                      )));

            default:
          }
        },
        initialRoute: '/auth',
      ),
    );
  }
}
