
A package to show your work portfolio/products catalogue with rolling images

## Getting started
## Usage

```dart
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

```
## Features
## App Screenshots

<table>
  <tr>
    <td>BoxShape = Rectangle</td>
     <td>BoxShape = Circle</td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/devAnkitGupta/rolling_images/master/assets/images/rollingImageRect.gif"></td>
    <td><img src="https://raw.githubusercontent.com/devAnkitGupta/rolling_images/master/assets/images/rollingImageCircle.gif"></td>
  </tr>
 </table>

## Web Screenshots

<img src='https://raw.githubusercontent.com/devAnkitGupta/rolling_images/master/assets/images/rollingImageWeb.gif'>

