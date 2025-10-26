import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_flutter/widget/takepicture_screen.dart'; // Impor widget yang benar

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Variabel untuk menyimpan kamera
  late final CameraDescription firstCamera;

  try {
    // Ambil daftar kamera yang tersedia di perangkat
    final cameras = await availableCameras();

    // Pilih kamera pertama (biasanya kamera belakang)
    firstCamera = cameras.first;
  } catch (e) {
    // Tangani error jika kamera tidak tersedia
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error: Kamera tidak tersedia - $e')),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
    return; // Hentikan eksekusi jika error terjadi
  }

  // Jalankan aplikasi dengan widget TakePictureScreen
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Tema gelap untuk UI yang elegan
      home: TakePictureScreen(camera: firstCamera),
    ),
  );
}
