import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsplash_gallery/core/app/app_preference.dart';
import 'package:unsplash_gallery/data/network/api_exception.dart';
import 'package:unsplash_gallery/features/components/custom_progress_loader.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';
import 'package:unsplash_gallery/features/screens/gallery/model/gallery_model.dart';

import '../../../components/custom_snackbar.dart';
import '../repository/gallery_repo_imp.dart';

part 'gallery_state.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  final GalleryRepositoryImp _galleryRepositoryImp;
  final AppPreferences _appPreferences;

  GalleryCubit(this._galleryRepositoryImp, this._appPreferences)
      : super(GalleryState());
  RefreshController homeTodayController =
      RefreshController(initialRefresh: false);
  RefreshController homeController = RefreshController(initialRefresh: false);

  int page = 1;

  List<GalleryModel>? allPhotos = [];

  Future<void> getGalleryData({bool isToday = false}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (page == 1 ||
        homeTodayController.isRefresh ||
        homeController.isRefresh) {
      showProgressDialog();
      page = 1;
      emit(state.copyWith(
          status: GalleryStatus.loading, hasReachedMax: false, allPhotos: []));
    }
    if (state.hasReachedMax) return;

    String fileName = "galleryData.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    var response = await _galleryRepositoryImp.getGalleryData({
      "client_id": dotenv.env['ACCESS_KEY'],
      "page": page,
      "per_page": 10,
    });

    response.fold(
      (failure) {
        dismissProgressDialog();
        showCustomSnackBar(
            context: GetContext.context,
            message:
                "Something went wrong.Please check your internet connection");
        if (failure.code == ResponseCode.unauthorised) {
          emit(state.copyWith(status: GalleryStatus.unAuthorized));
          _appPreferences.logout();
        } else {
          emit(state.copyWith(status: GalleryStatus.failure));
          homeController.refreshCompleted();
          homeController.loadComplete();
        }
      },
      (data) {
        if (data.isNotEmpty) {
          page++;
          if (connectivityResult == ConnectivityResult.none) {
            emit(
              state.copyWith(
                status: GalleryStatus.success,
                allPhotos: data,
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: GalleryStatus.success,
                allPhotos: [...?state.allPhotos, ...data],
              ),
            );
            try {
              file.writeAsStringSync(json.encode(state.allPhotos),
                  flush: true, mode: FileMode.write);
            } on Exception catch (e) {
              log(e.toString());
            }
          }
        } else {
          emit(state.copyWith(
              status: GalleryStatus.success, hasReachedMax: true));
        }
        homeController.refreshCompleted();
        homeController.loadComplete();
      },
    );
    dismissProgressDialog();
  }
}
