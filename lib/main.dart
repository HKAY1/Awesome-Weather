import 'package:awesomeweather/Bloc/weather_bloc.dart';
import 'package:awesomeweather/UI/search0.2.dart';
import 'package:awesomeweather/weatherRepo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';
import 'bloc_observer.dart';
import 'homepage.dart';

void main() async {
  Bloc.observer = WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorage.webStorageDirectory);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: WeatherRepo,
      child: BlocProvider(
          create: (_) => WeatherBloc(WeatherRepo()),
          child: MaterialApp(
            title: 'Awesome Weather',
            home: MyHomePage(),
            routes: {
              '/search': (context) => SearchPage(),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme:
                    GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
          )),
    );
  }
}
