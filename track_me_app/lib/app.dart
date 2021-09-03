import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bil_app/provider/bill_provider.dart';
import 'package:split_bil_app/screens/home_screen.dart';
import 'package:split_bil_app/screens/transaction_history_screen.dart';

class TrackMeApp extends StatelessWidget {
  const TrackMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Bills(),
      child: MaterialApp(
        routes: {
          TransactionHistoryScreen.routeName: (context) =>
              TransactionHistoryScreen(),
        },
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              fontSize: 20,
            ),
            headline5: TextStyle(
              fontSize: 16,
              color: Colors.white,
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                  color: Colors.black12,
                  offset: Offset(1.0, 2),
                )
              ],
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
