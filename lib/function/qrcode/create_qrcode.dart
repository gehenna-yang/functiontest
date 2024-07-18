import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

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
          qrcode_create(),
        ],
      ),
    );
  }
}

qrcode_create(){
  return Center(
    child: PrettyQr(
      data: '0x06b214a384033c1DA120524366a5D958f7415aDe',
      size: 200,
      typeNumber: 3,
      errorCorrectLevel: QrErrorCorrectLevel.M,
      roundEdges: true,
    ),
  );
}
