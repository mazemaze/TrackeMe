import 'package:flutter/material.dart';
import 'package:split_bil_app/screens/bill_split_screen.dart';
import 'package:split_bil_app/screens/input_modal_screen.dart';
import 'package:split_bil_app/screens/transaction_history_screen.dart';
import 'package:split_bil_app/widget/bill_list.dart';
import 'package:split_bil_app/widget/menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: screenWidth,
                          maxHeight: 250,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.blueAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: null,
                        ),
                      ),
                      BillListView(),
                    ],
                  ),
                ],
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuCard(
                              text: "レシートから読みとる",
                              function: () {},
                            ),
                            SizedBox(width: 8),
                            MenuCard(
                              text: "手動で入力",
                              function: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Navigator(
                                  onGenerateRoute: (context) =>
                                      MaterialPageRoute(
                                    builder: (context) =>
                                        BillInputModalScreen(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuCard(
                              text: "割り勘計算",
                              function: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Navigator(
                                  onGenerateRoute: (context) =>
                                      MaterialPageRoute(
                                    builder: (context) => BillSplitScreen(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            MenuCard(
                              text: "履歴",
                              function: () => Navigator.of(context).pushNamed(
                                  TransactionHistoryScreen.routeName),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
