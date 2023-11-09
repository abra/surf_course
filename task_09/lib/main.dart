import 'package:flutter/material.dart';

Future<void> main() async {
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
  final double _widgetHeight = 150;
  final double _widgetWidth = 150;
  int _imageIndex = 0;
  late List<String> _imagePathList;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late Size _screenSize;
  Offset? _offset;

  @override
  void initState() {
    super.initState();

    _imagePathList = _loadImagesPathList();

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
    if (_offset == null) {
      final centerX = _screenSize.width / 2 - _widgetWidth / 2;
      final centerY = _screenSize.height / 2 - _widgetHeight / 2;
      _offset = Offset(centerX, centerY);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeImageIndex() {
    if (_imageIndex < _imagePathList.length - 1) {
      ++_imageIndex;
    } else {
      _imageIndex = 0;
    }
    setState(() {});
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final offset = _offset;

    if (offset == null) {
      return;
    }

    double x = (offset.dx + details.delta.dx)
        .clamp(0, _screenSize.width - _widgetWidth)
        .toDouble();

    double y = (offset.dy + details.delta.dy)
        .clamp(0, _screenSize.height - _widgetHeight)
        .toDouble();

    setState(() {
      _offset = Offset(x, y);
    });
  }

  void _startRotate() {
    _controller.repeat();
  }

  void _stopRotate(_) {
    _controller.reset();
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    Offset offset = _offset!;

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
                    image: AssetImage(_imagePathList[_imageIndex]),
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
              onTap: _changeImageIndex,
              onPanUpdate: _onPanUpdate,
              onLongPress: _startRotate,
              onLongPressEnd: _stopRotate,
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _loadImagesPathList() {
  final images = <String>[];

  for (int i = 1; i <= 8; i++) {
    images.add('assets/cats/$i.png');
  }

  return images;
}
