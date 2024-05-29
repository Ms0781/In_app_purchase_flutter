import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase_flutter/purchases_flutter_library/view/paywall_widget.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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
              Align(
               alignment: Alignment.bottomCenter,
               child:  ElevatedButton(onPressed: () async{
                 try{
                   //

                   Purchases.getOfferings().then((currentOfferings){
                     Map<String,Offering> allOffering = currentOfferings.all;
                     List<String> allOfferingKeys = allOffering.keys.toList();
                     showModalBottomSheet(context: context, builder: (context){
                       return allOfferingKeys.isNotEmpty ? Container(
                         decoration: const BoxDecoration(
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10)
                             ),
                             color: Colors.white
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: allOfferingKeys.map((e) {
                             return StoreProductWidget(storeProduct: allOffering[e]!.availablePackages[0].storeProduct);
                           }).toList(),
                         ),
                       ) : SizedBox();
                     });
                   });
                 }catch(e){
                   print("Error : $e");
                 }

               },
                 style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.red,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10)
                     )
                 ), child: Text("Change The bar",style: GoogleFonts.roboto(fontSize: 22,color: Colors.white,)),
               ),
             )
            ],
          ),
        ),
      ),
    ));
  }
}
