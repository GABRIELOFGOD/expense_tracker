import 'package:expenses_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';

var gColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 12, 184),
);

var gDarkColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(
      MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: gDarkColor,
            cardTheme: const CardTheme().copyWith(
              color: gDarkColor.secondaryContainer,
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: gDarkColor.primaryContainer,
                foregroundColor: gDarkColor.onPrimaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: gDarkColor.onSecondaryContainer,
                  ),
                ),
          ),
          theme: ThemeData().copyWith(
            colorScheme: gColor,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: gColor.onPrimaryContainer,
              foregroundColor: gColor.primaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
              color: gColor.secondaryContainer,
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: gColor.onPrimaryContainer,
                foregroundColor: gColor.primaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: gColor.onSecondaryContainer,
                  ),
                ),
          ),
          home: const Expenses()),
    );
  // });
}
