import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/test_cubit.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TestCubit>().getTextList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: BlocConsumer<TestCubit, TestState>(
        builder: (ctx, state) {
          return state.state == PageState.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state.state == PageState.empty
                  ? Center(
                      child: Text('no Item Found'),
                    )
                  : ListView.builder(
                      itemCount: state.textList!.length,
                      itemBuilder: (context, index) => Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(state.textList![index]),
                              trailing: IconButton(
                                onPressed: () {
                                  context
                                      .read<TestCubit>()
                                      .removeTextItem(index);
                                },
                                icon: Icon(Icons.remove_circle),
                              ),
                            ),
                          ));
        },
        listener: (BuildContext context, TestState state) {
          if (state.state == PageState.remove) {
            log(state.textList.toString());
            log('fromlog====' + state.state.toString());
          }
        },
      ),
    );
  }
}
