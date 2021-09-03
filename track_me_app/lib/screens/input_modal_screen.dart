import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bil_app/models/bill.dart';
import 'package:split_bil_app/provider/bill_provider.dart';

class BillInputModalScreen extends StatefulWidget {
  const BillInputModalScreen({Key? key}) : super(key: key);

  @override
  _BillInputModalScreenState createState() => _BillInputModalScreenState();
}

class _BillInputModalScreenState extends State<BillInputModalScreen> {
  DateTime? _date = DateTime.now();
  DateTime? _selected;

  bool _isButtonEnable = false;

  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController amountCtrl = new TextEditingController();

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365 * 10),
      ),
    );
    if (picked != null) {
      setState(() {
        _date = picked;
        _selected = picked;
      });
      formValidation();
    }
  }

  void formValidation() {
    var _isfilled = (nameCtrl.text.isNotEmpty && amountCtrl.text.isNotEmpty);
    setState(() {
      _isButtonEnable = _isfilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bills = Provider.of<Bills>(context);
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
              SizedBox(height: 16),
              Text("お名前"),
              TextField(
                controller: nameCtrl,
                keyboardType: TextInputType.name,
                onChanged: (_) => formValidation(),
              ),
              SizedBox(height: 16),
              Text("金額"),
              TextField(
                controller: amountCtrl,
                keyboardType: TextInputType.number,
                onChanged: (_) => formValidation(),
              ),
              SizedBox(height: 16),
              Text("返済期日"),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text("日付選択"),
                  ),
                  SizedBox(width: 16),
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    width: 104,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: _selected != null
                        ? Text(
                            "${_date!.year} / ${_date!.month} / ${_date!.day}",
                            style: Theme.of(context).textTheme.headline5,
                          )
                        : Container(),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Center(
                child: Container(
                  width: 160,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _isButtonEnable
                        ? () {
                            bills.addItem(
                              Bill(
                                name: nameCtrl.text,
                                amount: int.parse(amountCtrl.text),
                                createdAt: DateTime.now(),
                                deadline: _selected != null ? _selected : null,
                              ),
                            );
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                        : null,
                    child: Text("追加"),
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
