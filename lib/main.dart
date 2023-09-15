//import 'package:check_internet_connection_with_bloc_cubit/bloc/check_internet_bloc.dart';
import 'package:check_internet_connection_with_bloc_cubit/cubit/check_internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create: (context) => CheckInternetBloc(),
      create: (context) => CheckInternetCubit()..checkSubscriptionConnectivity(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Check Internet App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePageView(),
      ),
    );
  }
}
