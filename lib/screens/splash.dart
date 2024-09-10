import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
	super.initState();
	_controller = AnimationController(
	  duration: const Duration(seconds: 2),
	  vsync: this,
	)..repeat(reverse: true);
	_animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

	Timer(const Duration(seconds: 5), () {
	  Navigator.of(context).pushReplacementNamed('/home');
	});
  }

  @override
  void dispose() {
	_controller.dispose();
	super.dispose();
  }

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  body: Center(
		child: FadeTransition(
		  opacity: _animation,
		  child: const Text(
			'UP Chiapas',
			style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
		  ),
		),
	  ),
	);
  }
}