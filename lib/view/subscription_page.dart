import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase_flutter/view/paywall_widget.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:  Text("In-App Purchase Demo",style: GoogleFonts.roboto(fontSize: 24,color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subscription Type :",style: GoogleFonts.roboto(
                fontSize: 18,
              ),),
              const Spacer(),
              ElevatedButton(onPressed: (){
               showModalBottomSheet(context: context, builder: (context){
                 return const Padding(
                   padding: EdgeInsets.all(10),
                   child: Column(
                     children: [
                       OfferingWidget(
                         title: 'Premium',
                         amount: '10',
                         description: 'User will get access of all premium features and additional 2 months of subscription.',),
                       SizedBox(height: 10,),
                       OfferingWidget(
                         title: 'Premium',
                         amount: '10',
                         description: 'User will get access of all premium features and additional 2 months of subscription.',)
                     ],
                   ),
                 );
               });
              },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ), child: Text("Change the weather",style: GoogleFonts.roboto(fontSize: 22,color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
