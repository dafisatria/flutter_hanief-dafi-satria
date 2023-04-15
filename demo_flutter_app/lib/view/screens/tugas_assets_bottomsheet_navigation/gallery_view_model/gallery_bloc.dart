import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:demo_flutter_app/model/data_gallery_models.dart';
part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  static List<Map<String, dynamic>> photos = [];
  GalleryBloc()
      : super(
          GalleryInitial(photos),
        ) {
    on<GalleryEvent>(
      (event, emit) {},
    );
  }
}
