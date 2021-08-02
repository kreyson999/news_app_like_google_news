import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.02,
        bottom: MediaQuery.of(context).size.width * 0.02,
      ),
      child: const Divider(
        thickness: 1,
      ),
    );
  }
}