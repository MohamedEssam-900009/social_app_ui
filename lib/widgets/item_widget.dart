import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  late final String title;
  late final int count;

  // ignore: prefer_const_constructors_in_immutables
  ItemWidget({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
