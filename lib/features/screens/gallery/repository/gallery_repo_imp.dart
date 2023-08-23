import 'package:dartz/dartz.dart';
import 'package:unsplash_gallery/data/network/api_failure.dart';
import 'package:unsplash_gallery/features/screens/gallery/model/gallery_model.dart';

abstract class GalleryRepositoryImp {
  Future<Either<ApiFailure, List<GalleryModel>>> getGalleryData(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> downloadImage(Map<String, dynamic> params,
      {String? imageUrl, String? localPath});
}
