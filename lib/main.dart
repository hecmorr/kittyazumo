import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/pages/home_page.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

//This class will handle the state of the provider

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Initialize instance of the provider
        ChangeNotifierProvider(
          create: (_) => GifProvider(),
          lazy: false,
        ),
      ],

      //This child calls the main application (MyApp)
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
