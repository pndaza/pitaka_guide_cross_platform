import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

enum ColorMode { day, night, speia, grayscale }
Map<ColorMode, List<double>> _predefinedFilters = {
  ColorMode.day: [
    //R  G   B    A  Const
    1, 0, 0, 0, 0, //
    0, 1, 0, 0, 0, //
    0, 0, 1, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
  ColorMode.grayscale: [
    //R  G   B    A  Const
    0.33, 0.59, 0.11, 0, 0, //
    0.33, 0.59, 0.11, 0, 0, //
    0.33, 0.59, 0.11, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
  ColorMode.night: [
    //R  G   B    A  Const
    -1, 0, 0, 0, 255, //
    0, -1, 0, 0, 255, //
    0, 0, -1, 0, 255, //
    0, 0, 0, 1, 0, //
  ],
  ColorMode.speia: [
    //R  G   B    A  Const
    0.393, 0.769, 0.189, 0, 0, //
    0.349, 0.686, 0.168, 0, 0, //
    0.172, 0.534, 0.131, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
};

class PdfPageView extends StatefulWidget {
  final PdfDocument pdfDocument;
  final int pageNumber;
  final ColorMode colorMode;
  final double renderWidth;
  const PdfPageView({
    Key? key,
    required this.pdfDocument,
    required this.pageNumber,
    required this.colorMode,
    this.renderWidth = 1500.0,
  }) : super(key: key);

  @override
  State<PdfPageView> createState() => _PdfPageViewState();
}

class _PdfPageViewState extends State<PdfPageView> {
  late Future<Uint8List?> byteImage;

  @override
  void initState() {
    super.initState();
    byteImage = _loadPageImage(widget.renderWidth);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
        future: byteImage,
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapShot.data == null) {
            return const Center(
              child: Text('something wrong'),
            );
          }
          return ColorFiltered(
            colorFilter:
                ColorFilter.matrix(_predefinedFilters[widget.colorMode]!),
            child: Image(
              fit: BoxFit.contain,
              image: MemoryImage(snapShot.data!),
            ),
          );
        });
  }

  Future<Uint8List?> _loadPageImage(double maxWidth) async {
    final pdfPage = await widget.pdfDocument.getPage(widget.pageNumber);
    final scaleFactor =
        _getScaleFactor(width: pdfPage.width, widthToRender: maxWidth);
    final pdfImage = await pdfPage.render(
      width: (pdfPage.width * scaleFactor),
      height: (pdfPage.height * scaleFactor),
    );
    pdfPage.close();
    return pdfImage?.bytes;
  }

  double _getScaleFactor(
          {required double width, required double widthToRender}) =>
      double.parse((widthToRender / width).toStringAsFixed(2));
}
