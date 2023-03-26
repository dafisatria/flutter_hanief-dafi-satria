import 'package:demo_flutter_app/tugas_assets_bottomsheet_navigation/new_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final gridImageList = <String>[
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
    'assets/image7.jpg',
    'assets/image8.jpg',
    'assets/image9.jpg',
    'assets/image10.jpg',
    'assets/image11.jpg',
    'assets/image12.jpg',
    'assets/image13.jpeg',
    'assets/image14.jpeg',
    'assets/image15.jpeg',
    'assets/image16.jpeg',
    'assets/image17.jpeg',
    'assets/image18.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          gridImageList.length,
          (index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => Container(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage(
                        gridImageList[index],
                      ),
                    ),
                  ),
                );
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text(
                      'Are You Sure',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('NO'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ImageSheet(
                                parameter: gridImageList[index],
                              ),
                            ),
                          );
                        },
                        child: const Text('YES'),
                      ),
                    ],
                  ),
                );
              },
              child: Image(
                image: AssetImage(
                  gridImageList[index],
                ),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
