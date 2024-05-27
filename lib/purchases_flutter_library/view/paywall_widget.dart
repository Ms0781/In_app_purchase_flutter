import 'package:flutter/material.dart';

class OfferingWidget extends StatelessWidget {
  final String title;
  final String amount;
  final String description;

  const OfferingWidget(
      {super.key,
      required this.title,
      required this.amount,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 10,),
          Text(description,
            style: const TextStyle(),
          )
        ],
      ),
    );
  }
}
