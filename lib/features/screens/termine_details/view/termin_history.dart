import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/widget/history_card.dart';

class TerminHistory extends StatefulWidget {
  final String? id;

  const TerminHistory({super.key, this.id});

  @override
  State<TerminHistory> createState() => _TerminHistoryState();
}

class _TerminHistoryState extends State<TerminHistory> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TerminDetailsCubit>().getTerminHistory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TerminDetailsCubit, TerminDetailsState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.allHistoryData?.length,
            itemBuilder: (context, index) {
              return HistoryCard(
                time: state.allHistoryData?[index].createdAt,
                action: state.allHistoryData?[index].action,
                userName: state.allHistoryData?[index].user?.fullName,
                statusChange: state.allHistoryData?[index].statusChange,
                comments: state.allHistoryData?[index].notes,
                oldStatus: state.allHistoryData?[index].oldStatus,
                newStatus: state.allHistoryData?[index].newStatus,
                categoryChange: state.allHistoryData?[index].categoryChange,
                oldCategory: state.allHistoryData?[index].oldStatus,
                newCategory: state.allHistoryData?[index].newCategory,
              );
            });
      },
    );
  }
}
