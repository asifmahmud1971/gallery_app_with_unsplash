import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:unsplash_gallery/features/screens/sliver_app_bar/model/user_model.dart';

part 'sliver_app_bar_state.dart';
 List<UserModel>? allUsers = [
   UserModel(id: 1, name: "name", isActive: false)
 ];

@injectable
class SliverAppBarCubit extends Cubit<SliverAppBarState> {


  SliverAppBarCubit() : super(SliverAppBarState(allUser: allUsers));


  addData(String name){
    emit(state.copyWith(status: SliverAppBarStatus.initial));
    final newList = state.allUser;
    newList?.add(UserModel(id: 22, name: name, isActive: false));
    emit(state.copyWith(status: SliverAppBarStatus.success,allUser: newList));
  }
  removeData(int index){
    emit(state.copyWith(status: SliverAppBarStatus.initial));
    final newList = state.allUser;
    newList?.removeAt(index);
    emit(state.copyWith(status: SliverAppBarStatus.success,allUser: newList));
  }

    isChecked(int index){
    emit(state.copyWith(status: SliverAppBarStatus.initial));
    var newList = state.allUser;
    newList?[index].isActive =  !newList[index].isActive;
    if(newList![index].isActive){
      addData("hasan");
    }else{
      removeData(index);
    }

    emit(state.copyWith(status: SliverAppBarStatus.success,allUser: newList));
  }
}
