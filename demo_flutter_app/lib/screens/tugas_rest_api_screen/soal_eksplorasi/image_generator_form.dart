import 'package:demo_flutter_app/model/api/services_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageGeneratorForm extends StatefulWidget {
  const ImageGeneratorForm({super.key});

  @override
  State<ImageGeneratorForm> createState() => _ImageGeneratorFormState();
}

class _ImageGeneratorFormState extends State<ImageGeneratorForm> {
  final MyService service = MyService();
  final TextEditingController nameController = TextEditingController();
  Future get() async {
    try {
      await service.fetchImageByName(nameController.text);
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
        title: const Text('Image Generator By Name'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                margin: const EdgeInsets.only(bottom: 20),
                child: (service.svg.isEmpty)
                    ? Image.network(
                        'https://womens-southerngolfassociation.org/wp-content/uploads/2021/10/Image-Not-Available.png')
                    : SvgPicture.string(service.svg, height: 300),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await get();
                  setState(() {
                    service.svg;
                  });
                },
                child: const Text('GENERATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
