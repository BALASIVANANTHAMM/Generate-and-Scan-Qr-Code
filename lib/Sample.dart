import 'package:flutter/material.dart';
import 'package:packages/web/WebView.dart';
import 'QrGenerate.dart';
import 'QrScanner.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerWeb = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView + QR code'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your URL'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(controller);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const Package();
                    }),
                  ),
                );
              },
              child: const Text('Check App Details')),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const QrScanner();
                    }),
                  ),
                );
              },
              child: const Text('Scan Qr Code')),
        ],
      ),
    );
  }
}