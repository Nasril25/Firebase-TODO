import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute: snapshot.data != null ? AppPages.INITIAL : Routes.LOGIN,
            getPages: AppPages.routes,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'inter',
            ),
          );
        },
      ),
    );
}
