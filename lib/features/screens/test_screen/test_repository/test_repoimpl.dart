import 'package:unsplash_gallery/features/screens/test_screen/test_model/test_model.dart';

abstract class TestRepoImpl {
  void addListItem();

  List<String> removeListItem(int index);

  Future<List<String>> getListItem();
}
