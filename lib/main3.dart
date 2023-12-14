import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimatedContainerWidth(),
    );
  }
}

class AnimatedContainerWidth extends StatefulWidget {
  const AnimatedContainerWidth({super.key});

  @override
  _AnimatedContainerWidthState createState() => _AnimatedContainerWidthState();
}

class _AnimatedContainerWidthState extends State<AnimatedContainerWidth>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 100, end: 300).animate(_controller);

    // Uncomment the line below if you want the animation to start automatically
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: _animation.value,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Container Width: ${_animation.value.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: _animation.value,
                    child: const Divider(
                      thickness: 5,
                    ),
                  ));
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // if (_controller.status == AnimationStatus.completed) {
                _controller.repeat(reverse: true);
                // _controller.reverse();
              // } else {
              // }
            },
            child: const Text('Toggle Width'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
