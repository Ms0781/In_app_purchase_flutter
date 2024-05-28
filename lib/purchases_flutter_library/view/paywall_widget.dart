import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class StoreProductWidget extends StatelessWidget {
  final StoreProduct storeProduct;
  const StoreProductWidget({super.key, required this.storeProduct});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await Purchases.purchaseStoreProduct(storeProduct).then((customerInfo){
          print(customerInfo.originalAppUserId);
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  storeProduct.title,
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Text(storeProduct.priceString,style: const TextStyle(color: Colors.white),)
              ],
            ),
            const SizedBox(height: 10,),
            Text(storeProduct.description,
              style: const TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
