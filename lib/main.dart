import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobseekerapp/LoginPage/login_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  const MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
     future: _initialization,
      builder: (context, snapshot){
       if(snapshot.connectionState == ConnectionState.waiting){
         return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('JobSeeker App is being initialized',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
         );
       }
       else if(snapshot.hasError){
         return const MaterialApp(
           home: Scaffold(
             body: Center(
               child: Text('An error has been occurred',
                 style: TextStyle(
                   color: Colors.cyan,
                   fontSize: 35,
                   fontWeight: FontWeight.bold,
                   fontFamily: 'Roboto '
                 ),
               ),
             ),
           ),
         );
       }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job Seerker App',
           theme: ThemeData(
             scaffoldBackgroundColor: Colors.black,
             primarySwatch: Colors.blue,
           ),
          home: Login(

            // body: Center(
            //   child: Text('Rammm',
            //   style: TextStyle(color: Colors.white ),
            //   ),
            // ),
          ),
        );
      }
    );
  }
}

