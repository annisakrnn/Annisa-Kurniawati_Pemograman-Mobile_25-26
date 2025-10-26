import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  Color _selectedFilter = Colors.transparent;
  bool _isTakingPicture = false;

  final List<Color> _availableFilters = [
    Colors.transparent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
  ];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFilterChanged(Color color) {
    setState(() => _selectedFilter = color);
  }

  Future<void> _takePicture() async {
    if (_controller.value.isTakingPicture) return;
    setState(() => _isTakingPicture = true);
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      if (!mounted) return;

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            filterColor: _selectedFilter,
          ),
        ),
      );
    } catch (e) {
      debugPrint('❌ Error taking picture: $e');
    } finally {
      setState(() => _isTakingPicture = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // 🔹 Tampilan kamera penuh
                Positioned.fill(child: CameraPreview(_controller)),

                // 🔹 Overlay filter warna
                Positioned.fill(
                  child: Container(color: _selectedFilter.withOpacity(0.3)),
                ),

                // 🔹 Filter selector di atas tombol shutter
                Positioned(
                  bottom: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _availableFilters.map((color) {
                      final isSelected = color == _selectedFilter;
                      return GestureDetector(
                        onTap: () => _onFilterChanged(color),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: isSelected ? 40 : 35,
                          height: isSelected ? 40 : 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withOpacity(0.8),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // 🔹 Tombol shutter
                Positioned(
                  bottom: 20,
                  child: GestureDetector(
                    onTap: _isTakingPicture ? null : _takePicture,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: _isTakingPicture ? 70 : 80,
                      height: _isTakingPicture ? 70 : 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6),
                        color: _isTakingPicture
                            ? Colors.white54
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// 🖼️ Halaman hasil foto
class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.filterColor,
  });

  final String imagePath;
  final Color filterColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display Picture')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(File(imagePath), fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: filterColor.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}
