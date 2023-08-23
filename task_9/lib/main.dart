import 'dart:developer';

import 'package:flutter/material.dart';

List<Image> catImages = [];

Future<void> main() async {
  catImages = await _loadCatImages();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _imageIndex = 0;
  final double _widgetHeight = 150;
  final double _widgetWidth = 150;
  late Image _currentImage;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late Offset offset;
  late double _screenWidth;
  late double _screenHeight;
  bool _firstStart = true;

  @override
  void initState() {
    super.initState();
    _currentImage = Image(image: catImages[_imageIndex].image);

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeImage() {
    if (_imageIndex < catImages.length - 1) {
      _currentImage = Image(image: catImages[++_imageIndex].image);
    } else {
      _imageIndex = 0;
      _currentImage = Image(image: catImages[_imageIndex].image);
    }
    setState(() {});
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double x = (offset.dx + details.delta.dx)
        .clamp(0, _screenWidth - _widgetWidth)
        .toDouble();

    double y = (offset.dy + details.delta.dy)
        .clamp(0, _screenHeight - _widgetHeight)
        .toDouble();

    setState(() {
      offset = Offset(x, y);
    });
  }

  void _rotate() {
    _controller.repeat();
  }

  void _stopRotate(LongPressEndDetails details) {
    _controller.reset();
    _controller.stop();
  }

  void _init(BuildContext context) {
    if (_firstStart) {
      _screenWidth = MediaQuery.of(context).size.width;
      _screenHeight = MediaQuery.of(context).size.height;
      final currentPosX = _screenWidth / 2 - _widgetWidth / 2;
      final currentPosY = _screenHeight / 2 - _widgetHeight / 2;
      offset = Offset(currentPosX, currentPosY);
      _firstStart = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _init(context);

    return ColoredBox(
      color: const Color(0xFF077777),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 10),
            top: offset.dy,
            left: offset.dx,
            child: RotationTransition(
              turns: _animation,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _currentImage.image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                height: _widgetHeight,
                width: _widgetWidth,
                duration: const Duration(milliseconds: 100),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _changeImage,
              onPanUpdate: _onPanUpdate,
              onLongPress: _rotate,
              onLongPressEnd: _stopRotate,
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Image>> _loadCatImages() async {
  final images = <Image>[];

  for (int i = 1; i <= 8; i++) {
    images.add(Image(image: AssetImage('assets/cats/$i.png')));
  }

  return images;
}
