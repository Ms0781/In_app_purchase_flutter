import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:in_app_purchase_flutter/controller/subscription_controller.dart';
import 'package:in_app_purchase_flutter/utils/const.dart';
import 'package:in_app_purchase_flutter/utils/store_config.dart';
import 'package:in_app_purchase_flutter/view/subscription_page.dart';
import 'package:provider/provider.dart';

void main() {

  if(io.Platform.isIOS){
    StoreConfig(store: Store.appleStore, apiKey: AppConstants.appleKey);
  }else if(io.Platform.isAndroid){
    StoreConfig(store: Store.googlePlay, apiKey: AppConstants.androidKey);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SubscriptionProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SubscriptionPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
