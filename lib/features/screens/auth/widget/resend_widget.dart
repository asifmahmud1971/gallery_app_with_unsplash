import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/screens/auth/cubit/auth_cubit.dart';

class ResendWidget extends StatefulWidget {
  final String email;

  const ResendWidget({Key? key, required this.email}) : super(key: key);

  @override
  State<ResendWidget> createState() => _ResendWidgetState();
}

class _ResendWidgetState extends State<ResendWidget> {
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _timer!.cancel();
            _start = 60;
          });
        } else {
          setState(() {
            _start--;
          });
          log(_start.toString());
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return InkWell(
          onTap: _start == 60
              ? () {
                  context.read<AuthCubit>().resentOtp(email: widget.email);
                  startTimer();
                }
              : null,
          child: Text(
            _start == 60 ? " ${AppStrings.sendCodeAgain.tr()}" : '($_start)',
            style: kRegularLine15.copyWith(
                color: _start == 60 ? Colors.blue : Colors.grey),
          ),
        );
      },
    );
  }
}
