import 'package:flutter/material.dart';

import 'filter_selector.dart';

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.transparent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
  ];

  final ValueNotifier<Color> _filterColor = ValueNotifier<Color>(
    Colors.transparent,
  );

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Filter Foto'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 🖼️ Gambar utama dengan efek filter warna
          Positioned.fill(child: _buildPhotoWithFilter()),

          // 🎨 Selector filter di bawah
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildFilterSelector(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, _) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            color.withOpacity(0.4),
            BlendMode.softLight, // efek lembut seperti filter IG
          ),
          child: Image.asset('assets/images/jennie.jpg', fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(filters: _filters, onFilterChanged: _onFilterChanged);
  }
}
