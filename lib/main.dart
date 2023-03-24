import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/veiw/home_page.dart';
import 'package:firebase_demo/veiw/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication/auth_fire.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lorem Ipsum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: const Color(0xffE43228),
      ),
      home: StreamBuilder(
        stream: Auth().firebaseauth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          }
          else{
            return LoginPage();
          }
        }
      ),
    );
  }
}
