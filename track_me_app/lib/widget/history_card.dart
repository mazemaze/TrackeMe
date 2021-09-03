import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bil_app/models/bill.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bill = Provider.of<Bill>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 112,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Card(
        color: Colors.blue,
        child: Row(
          children: [
            Container(
              width: 136,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(bill.category!),
                  Text(
                      "${bill.createdAt!.year}年${bill.createdAt!.month}月${bill.createdAt!.day}日"),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        bill.name!,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Text(
                      "${bill.amount} 円",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
