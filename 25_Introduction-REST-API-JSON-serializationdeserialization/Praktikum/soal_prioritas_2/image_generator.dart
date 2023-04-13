import 'package:demo_flutter_app/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageGenerator extends StatefulWidget {
  const ImageGenerator({super.key});

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  final MyService service = MyService();
  Future get() async {
    try {
      await service.fetchImage();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              margin: const EdgeInsets.only(bottom: 20),
              child: (service.svg.isEmpty)
                  ? Image.network(
                      'https://womens-southerngolfassociation.org/wp-content/uploads/2021/10/Image-Not-Available.png')
                  : SvgPicture.string(service.svg, height: 300),
            ),
            ElevatedButton(
              onPressed: () async {
                await get();
                setState(() {
                  service.svg;
                });
              },
              child: const Text('GET'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff6200EE)),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/image-generator-form');
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
