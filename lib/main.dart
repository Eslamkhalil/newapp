import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:newapp/shared/my_bloc_observer.dart';

import 'modules/home_screen/home_screen.dart';
import 'network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}




