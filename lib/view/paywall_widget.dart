import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferingWidget extends StatelessWidget {
  final String title;
  final String amount;
  final String description;
  const OfferingWidget({super.key, required this.title, required this.amount, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Text(title,style: GoogleFonts.roboto(fontSize: 22,color: Colors.white),),
            const SizedBox(width: 5,),
            const Icon(Icons.lock,color: Colors.white,)
          ],),
          Text(description,style: GoogleFonts.roboto(fontSize: 18),)
        ],
      ),
    );
  }
}
