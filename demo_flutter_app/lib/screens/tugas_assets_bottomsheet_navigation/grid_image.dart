import 'package:demo_flutter_app/bloc/gallery/gallery_bloc.dart';
import 'package:demo_flutter_app/screens/tugas_assets_bottomsheet_navigation/new_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state is GalleryInitial) {
            return GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                state.photos.length,
                (index) {
                  final photo = state.photos[index];
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
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
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
                                              parameter: photo['name'],
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
                                photo['name'],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Image(
                      image: AssetImage(
                        photo['name'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
