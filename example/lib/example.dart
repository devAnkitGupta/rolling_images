import 'package:flutter/material.dart';
import 'package:rolling_images/rolling_images.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rolling Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RollingCards(
        viewportFraction: 1,
        imageUrls: const [
          'https://images.pexels.com/photos/11730329/pexels-photo-11730329.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'https://images.pexels.com/photos/3777622/pexels-photo-3777622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'https://images.pexels.com/photos/3186010/pexels-photo-3186010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ],
        isLocalAsset: false,
        onPageChanged: (int page) {
          // Get Notified about current page
        },
      ),
    );
  }
}
