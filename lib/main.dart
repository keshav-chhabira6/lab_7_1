import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _countdown = 10;
  bool _isCounting = false;

  void _startTimer() async {
    setState(() {
      _isCounting = true;
      _countdown = 10;
    });

    for (int i = _countdown; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _countdown--;
        });
      });
    }

    setState(() {
      _isCounting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer with Future.delayed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time remaining: $_countdown seconds',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isCounting ? null : _startTimer,
              child: const Text('Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
