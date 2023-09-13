import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:unsplash_gallery/features/screens/test_screen/test_repository/test_repoimpl.dart';

part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  final TestRepoImpl _impl;
  List<String> testList = [];

  TestCubit(this._impl) : super(TestState());

  getTextList() async {
    emit(state.copyWith(state: PageState.loading));
    print('print from repo');
    testList = await _impl.getListItem();
    emit(state.copyWith(state: PageState.initial, textList: testList));
  }

  removeTextItem(int index) {
    emit(state.copyWith(state: PageState.initial));
    try {
      state.textList!.removeAt(index);
      print(state.textList);
      emit(state.copyWith(state: PageState.remove, textList: state.textList!));
    } catch (e) {
      print('testCubitLog:$e');
    }
  }
}
