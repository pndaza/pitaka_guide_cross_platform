
import 'package:pdfx/pdfx.dart';

class PdfInfo {
  PdfDocument document;
  int pageCount;
  double width;
  double height;
  PdfInfo(
    this.document,
    this.pageCount,
    this.width,
    this.height,
  );
}
