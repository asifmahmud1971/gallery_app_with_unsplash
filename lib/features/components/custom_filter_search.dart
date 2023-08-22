class LocalSearch {
  static var items = <String>[];

  static void filterSearchResults(
      {String query = "", list, Function? callback}) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(list);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      callback!;
      items.clear();
      items.addAll(dummyListData);

      return;
    } else {
      callback!;
      items.clear();
      items.addAll(list);
    }
  }
}
