import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';

class TerminHelper {
  bool isOthers() {
    return GetContext.context
                .read<TerminDetailsCubit>()
                .selectedExplanationValue
                .value ==
            "Other" &&
        GetContext.context.read<TerminDetailsCubit>().selectedResult?.value ==
            "Negative" &&
        GetContext.context.read<TerminDetailsCubit>().selectedAppointment == 0;
  }

  bool isExplanation() {
    if ((GetContext.context.read<TerminDetailsCubit>().selectedAppointment ==
                0 &&
            GetContext.context
                    .read<TerminDetailsCubit>()
                    .selectedResult
                    ?.value ==
                "Negative") ||
        GetContext.context.read<TerminDetailsCubit>().selectedAppointment ==
            1) {
      return true;
    }
    return false;
  }

  bool isPhoto() {
    if (GetContext.context.read<TerminDetailsCubit>().selectedAppointment ==
            1 &&
        (GetContext.context
                    .read<TerminDetailsCubit>()
                    .selectedExplanationValue
                    .value ==
                "Not at home" ||
            GetContext.context
                    .read<TerminDetailsCubit>()
                    .selectedExplanationValue
                    .value ==
                "Untraceable")) {
      return true;
    }
    return false;
  }

  bool isExpirationYear() {
    if (GetContext.context
                .read<TerminDetailsCubit>()
                .selectedExplanationValue
                .value ==
            "Multi-year contract" &&
        GetContext.context.read<TerminDetailsCubit>().selectedResult?.value ==
            "Negative") {
      return true;
    }
    return false;
  }
}
