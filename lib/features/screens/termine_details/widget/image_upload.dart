import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/components/custom_dialogs.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/widget/dotted_button.dart';
import 'package:terminator/features/screens/termine_details/widget/image_card.dart';

class ImageUpload extends StatefulWidget {
  final String? title;

  const ImageUpload({super.key, this.title});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? selectedImagePath;

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  String? _image1 = "";
  final picker = ImagePicker();
  String? type;
  List fileList = [];
  TextEditingController _controller = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String? base64Image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      _image1 = pickedFile.path;
      //fileList.add(_image1);
      context.read<TerminDetailsCubit>().addFile(_image1);
      //fileDataModel!.fileDataList!.add(FileData(path: _image1, type: "image"));
      log(fileList.toString());
      //convert to bytes
      setState(() {});

      type = "image";
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? "TEst",
          style: kRegularLine14.copyWith(
              fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedButton(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();

                  CustomDialog.showBottomDialog(takePhoto: () {
                    GetContext.back();
                    getImage(ImageSource.camera);
                  }, selectImage: () {
                    GetContext.back();
                    getImage(ImageSource.gallery);
                  });
                },
              ),
              Expanded(
                child: Wrap(
                  children: List.generate(
                    context.read<TerminDetailsCubit>().fileList.length,
                    (index) {
                      return context
                              .read<TerminDetailsCubit>()
                              .fileList
                              .isNotEmpty
                          ? ImageCard(
                              fileName: context
                                  .read<TerminDetailsCubit>()
                                  .fileList[index],
                              onDelete: () {
                                context
                                    .read<TerminDetailsCubit>()
                                    .fileList
                                    .removeAt(index);

                                setState(() {});
                              },
                            )
                          : Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
