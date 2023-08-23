import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';

import '../../../components/custom_snackbar.dart';

class DownloadingDialog extends StatefulWidget {
  final String? url;

  const DownloadingDialog({Key? key, this.url}) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    String url = widget.url ?? "";

    String fileName =
        "unsplash${DateTime.now().microsecond + Random().nextInt(1000)}";
    if (!await checkPermission()) {
      showCustomSnackBar(
          context: GetContext.context, message: "Storage permission needed");
      return;
    }
    String path = await _getFilePath(fileName);
    print(path);
    try {
      await dio.download(
        url,
        path,
        onReceiveProgress: (recivedBytes, totalBytes) {
          setState(() {
            progress = recivedBytes / totalBytes;
          });

          //print(progress);
        },
        deleteOnError: true,
      ).then((_) {
        Navigator.pop(context);
      });
    } on Exception catch (e) {
      Navigator.pop(context);
      showCustomSnackBar(
          context: context,
          message:
              "Something went wrong.Please check your internet connection");
    }
  }

  Future<String> _getFilePath(String filename) async {
    String? downloadDirectory;
    if (Platform.isAndroid) {
      downloadDirectory = '/storage/emulated/0/Download';
    } else {
      final downloadFolder = await getDownloadsDirectory();
      if (downloadFolder != null) {
        downloadDirectory = downloadFolder.path;
      }
    }
    return "$downloadDirectory/$filename.png";
  }

  Future<bool> checkPermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
