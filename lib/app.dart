import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'providers/garment_provider.dart';
import 'providers/outfit_provider.dart';
import 'providers/outfit_usage_provider.dart';

import 'screens/navigation/main_navigation_screen.dart';

class ClosetAIApp extends StatelessWidget {
  const ClosetAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) =>
              GarmentProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) =>
              OutfitProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) =>
              OutfitUsageProvider(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Closet AI',
        home: const MainNavigationScreen(),
      ),
    );
  }
}