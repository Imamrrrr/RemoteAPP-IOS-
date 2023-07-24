import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Remote App Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToRemoteScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RemoteScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _navigateToRemoteScreen,
          child: const Text('Go to Remote Screen'),
        ),
      ),
    );
  }
}

class RemoteScreen extends StatelessWidget {
  const RemoteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          ' ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JoystickButton(
                    onPressed: () {
                      // Handle up button press
                    },
                    child: Icon(Icons.arrow_upward),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      JoystickButton(
                        onPressed: () {
                          // Handle left button press
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 16),
                      JoystickButton(
                        onPressed: () {
                          // Handle right button press
                        },
                        child: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  JoystickButton(
                    onPressed: () {
                      // Handle down button press
                    },
                    child: Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Image.asset(
                  'assets/fullscreen_image.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: (
                      Text("atas")
                    ) {
                      // Handle up button press
                    },
                    child: Icon(Icons.arrow_upward),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // Handle left button press
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 16),
                      FloatingActionButton(
                        onPressed: () {
                          // Handle right button press
                        },
                        child: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // Handle down button press
                    },
                    child: Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JoystickButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const JoystickButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: child,
        color: Colors.black,
      ),
    );
  }
}
