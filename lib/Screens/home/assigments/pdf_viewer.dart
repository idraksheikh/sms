import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewer extends StatefulWidget {
  final String pdfUrl;

  const PdfViewer({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  PDFDocument? document;

  void initializePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    initializePdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: document != null ? PDFViewer(document: document!) : const Center(child: CircularProgressIndicator(),)
    );
  }
}
