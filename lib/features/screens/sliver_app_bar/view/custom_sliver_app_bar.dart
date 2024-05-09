import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/strings.dart';
import 'package:unsplash_gallery/features/screens/sliver_app_bar/cubit/sliver_app_bar_cubit.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliverAppBarCubit, SliverAppBarState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              //2
              SliverAppBar(
                leading: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios_new,
                      color: AppColors.kBackGroundColor),
                ),
                automaticallyImplyLeading: true,
                title: Text("Hello"),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<SliverAppBarCubit>().addData("hkkk");
                    },
                    icon: Icon(Icons.add_box),
                  )
                ],
                elevation: 14,
                snap: false,
                stretch: true,
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(''),
                  background: Image.network(
                    kDemoImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return ListTile(
                      leading: Container(
                        padding: EdgeInsets.symmetric(vertical: AppCommonSize.s4),
                        width: 90,
                        child: Image.network(
                          kDemoImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      //title: Text('Place ${1}'),
                      title: Row(
                        children: [
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Place ${state.allUser?[index].name}'),
                              InkWell(
                                onTap: (){
                                  state.allUser?[index].copyWith(isActive: true);
                                },
                                  child: Text('${state.allUser?[index].isActive}')),
                            ],
                          )),
                          IconButton(
                            onPressed: () => context
                                .read<SliverAppBarCubit>()
                                .addData("tttt"),
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<SliverAppBarCubit>().isChecked(index);

                            },
                            icon: state.allUser![index].isActive
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.grey,
                                  ),
                          ),
                          IconButton(
                            onPressed: () => context
                                .read<SliverAppBarCubit>()
                                .removeData(index),
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: state.allUser?.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
