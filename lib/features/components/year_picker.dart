import 'package:flutter/material.dart';

Future flutterYearPicker(BuildContext context,
    {Function(String)? getDate}) async {
  return showDialog(
    context: context,
    builder: (context) {
      final Size size = MediaQuery.of(context).size;
      return AlertDialog(
        title: Column(
          children: const [
            Text('Select a Year'),
            Divider(
              thickness: 1,
            )
          ],
        ),
        contentPadding: const EdgeInsets.all(10),
        content: SizedBox(
          height: size.height / 3,
          width: size.width,
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            childAspectRatio: 2,
            children: [
              ...List.generate(
                123,
                (index) => InkWell(
                  onTap: () {
                    getDate!((2050 - index).toString());
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: Chip(
                      label: Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          (2050 - index).toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
