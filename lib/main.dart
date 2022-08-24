import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/screens/splash/splash_screen.dart';
import 'constants/styles.dart';
import 'db/models/data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.transparent),
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0),
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
