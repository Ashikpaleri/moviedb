import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:machine_test/home/home_module/presentation/feature/screen/home_screen.dart';
import 'package:machine_test/home/home_module/presentation/feature/screen/splash_screen.dart';

import 'home/home_module/presentation/feature/bloc/home_bloc/home_data_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("fav_data_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<HomeDataBloc>(
      lazy: true,
      create: (_) => HomeDataBloc(),
    ),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
      ),
    );
  }
}

