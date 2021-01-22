import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanPage extends StatefulWidget {
  bool sender;
  ScanPage(this.sender);
  @override
  _ScanPageState createState() => _ScanPageState(sender);
}

class _ScanPageState extends State<ScanPage> {
  bool sender;

  String code = '';
  _ScanPageState(this.sender);

  Future _scan() async {
    String qrcode = await scanner.scan();
    setState(() => this.code = qrcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Argus"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _scan,
            child: Container(
              child: Text(sender.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
