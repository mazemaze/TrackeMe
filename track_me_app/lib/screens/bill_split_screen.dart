import 'package:flutter/material.dart';

class BillSplitScreen extends StatefulWidget {
  const BillSplitScreen({Key? key}) : super(key: key);

  @override
  _BillSplitScreenState createState() => _BillSplitScreenState();
}

class _BillSplitScreenState extends State<BillSplitScreen> {
  TextEditingController priceCtrl = new TextEditingController();
  TextEditingController numberofPersonCtrl = new TextEditingController();
  double? result;
  bool _isButtonEnable = false;
  void formValidation() {
    var _isfilled =
        (priceCtrl.text.isNotEmpty && numberofPersonCtrl.text.isNotEmpty);
    setState(() {
      _isButtonEnable = _isfilled;
    });
  }

  void billCalculation() {
    setState(() {
      result =
          double.parse(priceCtrl.text) / double.parse(numberofPersonCtrl.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Center(
                child: Text(
                  result != null
                      ? "一人当たりの金額：${result!.toInt()}円"
                      : "金額、割る人数を入力してください",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(height: 32),
              Text("割り勘する金額"),
              TextField(
                controller: priceCtrl,
                keyboardType: TextInputType.name,
                onChanged: (_) => formValidation(),
              ),
              SizedBox(height: 32),
              Text("人数"),
              TextField(
                controller: numberofPersonCtrl,
                keyboardType: TextInputType.number,
                onChanged: (_) => formValidation(),
              ),
              SizedBox(height: 32),
              Center(
                child: Container(
                  width: 160,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _isButtonEnable ? () => billCalculation() : null,
                    child: Text("計算"),
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
