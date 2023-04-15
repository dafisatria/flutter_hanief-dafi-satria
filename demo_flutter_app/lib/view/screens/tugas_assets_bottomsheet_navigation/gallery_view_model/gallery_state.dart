part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

class GalleryInitial extends GalleryState {
  final List<Map<String, dynamic>> photos = [
    {'name': gridImageList[0]},
    {'name': gridImageList[1]},
    {'name': gridImageList[2]},
    {'name': gridImageList[3]},
    {'name': gridImageList[4]},
    {'name': gridImageList[5]},
    {'name': gridImageList[6]},
    {'name': gridImageList[7]},
    {'name': gridImageList[8]},
    {'name': gridImageList[9]},
    {'name': gridImageList[10]},
    {'name': gridImageList[11]},
  ];
  GalleryInitial(photos);
}
