import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:unsplash_gallery/features/screens/test_screen/test_model/test_model.dart';
import 'package:unsplash_gallery/features/screens/test_screen/test_repository/test_repoimpl.dart';

@Injectable(as: TestRepoImpl)
class TestRepo extends TestRepoImpl {
  @override
  void addListItem() {
    // TODO: implement addListItem
  }

  @override
  Future<List<String>> getListItem() async {
    // TODO: implement getListItem
    List<String> textList = [];
    print('print from repo');
    try {
      await Future.delayed(Duration(seconds: 3), () {
        TestModel testData = TestModel(DemoData.textList);
        testData.testList.forEach((element) {
          textList.add(element);
        });
      });
      return textList;
    } catch (e) {
      log('something wrong with$e');
      return List.empty();
    }
  }

  @override
  List<String> removeListItem(int index) {
    // TODO: implement removeListItem
    return [];
  }
}
