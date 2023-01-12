import 'package:flutter/material.dart';

class CreateQR extends StatefulWidget {
  const CreateQR({Key? key}) : super(key: key);

  @override
  State<CreateQR> createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create QR Code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ],
      ),
    );
  }
}
