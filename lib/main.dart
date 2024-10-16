import 'package:contact_app/routes/routes.dart';

import 'package:contact_app/screens/counter/provider/counter_provider.dart';
import 'package:contact_app/screens/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CounterProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CounterProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CounterProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CounterProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CounterProvider(),
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
