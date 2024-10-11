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
  QRViewController? controller;
  Barcode? result;
  bool showQRISImage = false;

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
        showQRISImage = false;
      });
    }
  }

  void _navigateToQRIS() {
    setState(() {
      showQRISImage = true;
      _pickedImage = null;
    });
  }

  void _navigateToScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScannerPage()),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceWidth = mediaQuery.size.width;
    final deviceHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Metode Pembayaran',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              'TOP UP',
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Baris pertama opsi pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentOption('assets/images/visa.png', 'Visa', deviceWidth, deviceHeight),
              ],
            ),
            const SizedBox(height: 20),
            // Baris kedua opsi pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentOption('assets/images/bca.png', 'BCA', deviceWidth, deviceHeight),
                _buildPaymentOption('assets/images/dana.png', 'Dana', deviceWidth, deviceHeight),
              ],
            ),
            const SizedBox(height: 20),
           
            if (showQRISImage)
              Image.asset('assets/images/qris.png', height: deviceHeight * 0.3),
            if (_pickedImage != null)
              Image.file(_pickedImage!, height: deviceHeight * 0.3),
          ],
        ),
      ),
      
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.qr_code_scanner),
                  onPressed: _navigateToScanner,
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.qr_code_2),
                  onPressed: _navigateToQRIS,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat opsi pembayaran
  Widget _buildPaymentOption(String imageUrl, String label, double deviceWidth, double deviceHeight) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imageUrl,
              width: deviceWidth * 0.2, // Ukuran responsif berdasarkan lebar layar
              height: deviceHeight * 0.1, // Ukuran responsif berdasarkan tinggi layar
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

// Halaman pemindai QR
class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
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
          Expanded(
            flex: 2,
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
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}