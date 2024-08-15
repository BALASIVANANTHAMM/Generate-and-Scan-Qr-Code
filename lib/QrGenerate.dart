import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QRImage extends StatelessWidget {
  QRImage(this.controller, {super.key});

  final TextEditingController controller;
  final key1 = GlobalKey();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            RepaintBoundary(
              child: QrImageView(
                data: controller.text,
                size: 280,
                // You can include embeddedImageStyle Property if you
                //wanna embed an image from your Asset folder
                embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(
                    100,
                    100,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              try {
                RenderRepaintBoundary boundary = key1.currentContext!
                    .findRenderObject() as RenderRepaintBoundary;
//captures qr image
                var image = await boundary.toImage();

                ByteData? byteData =
                    await image.toByteData(format: ImageByteFormat.png);

                Uint8List pngBytes = byteData!.buffer.asUint8List();
//app directory for storing images.
                final appDir = await getTemporaryDirectory();
//current time
                var datetime = DateTime.now();
                final path = '${appDir.path}/$datetime.png';
//qr image file creation
                File(path).writeAsBytes(pngBytes);
//appending data
//Shares QR image
              await Share.shareXFiles(
              [XFile(path)],
              text: "Share the QR Code",
              );
              } catch (e) {
              print(e.toString());
              }
            }, child: const Text('Share Qr'))  //In this app not included the share option future i will push
          ],
        ),
      ),
    );
  }
}