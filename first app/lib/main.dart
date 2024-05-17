import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: const BoxGrid(),
      ),
    );
  }
}

class BoxGrid extends StatelessWidget {
  const BoxGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.brown,
      Colors.cyan,
      Colors.lime,
      Colors.indigo,
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: List.generate(12, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(boxNumber: index + 1),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Box ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final int boxNumber;

  const SecondScreen({Key? key, required this.boxNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Box $boxNumber'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (boxNumber == 1)
                const Column(
                  children: [
                    Text(
                      'Heading for Box 1',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'This is a paragraph specifically for Box 1. It contains additional details and information relevant to Box 1. You can add more descriptive text here as needed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              if (boxNumber == 1)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PdfViewScreen()),
                    );
                  },
                  child: const Text('Open PDF'),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({Key? key}) : super(key: key);

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/sample.pdf', 'sample.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      return file;
    } catch (e) {
      throw Exception("Error copying asset file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF View'),
      ),
      body: pathPDF.isNotEmpty
          ? PDFView(
              filePath: pathPDF,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
