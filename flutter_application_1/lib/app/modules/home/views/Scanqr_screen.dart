import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class ScanQRScreen extends StatefulWidget {
  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller; // Declare the QRViewController
  Barcode? result;

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera(); // Pause the camera properly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: [
          _pickedImage != null
              ? Image.file(_pickedImage!)
              : Text("No image selected"),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Pick QR Code Image from Gallery'),
          ),
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          if (result != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'QR Code Data: ${result!.code}',
                style: TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller; // Assign the controller instance
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData; // Capture the scanned data
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose(); // Dispose the controller properly
    super.dispose();
  }
}
