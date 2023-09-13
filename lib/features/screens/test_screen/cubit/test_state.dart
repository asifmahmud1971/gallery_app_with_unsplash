part of 'test_cubit.dart';

enum PageState { initial, remove ,loading,empty}

class TestState extends Equatable {
  final dynamic state;
  final List<String>? textList;

   TestState({this.textList, this.state = PageState.loading});

   TestState init(){
    return TestState(textList: []);
   }

  TestState copyWith({
    List<String>? textList,
    dynamic state,
  }) {
    return TestState(
        state: state ?? this.state, textList: textList ?? this.textList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [state, textList ?? []];
}
