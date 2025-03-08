import 'dart:async';
import 'package:flutter/material.dart';
import 'package:event_handeler/event_handeler.dart'; // Import your package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _count++;
      dispatchCustomEvent(
          "Updated content from outside!${_count}", "bottomsheet_update");
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event-Based BottomSheet")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openBottomSheet(context),
          child: Text("Open BottomSheet"),
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    StreamSubscription? eventSubscription; // Store the subscription

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            String content = "Initial content inside BottomSheet";

            // Listen for updates and store the subscription and only add the listener once
            eventSubscription ??=
                addCustomEventListener("bottomsheet_update", (data) {
              print(data);
              if (mounted) {
                setState(() {
                  content =
                      data; // Update BottomSheet when an event is received
                });
              }
            });

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(content, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text("Press the floating button to update me!"),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() async {
      print("BottomSheet closed");
      // Cancel the subscription when the BottomSheet is closed
      await eventSubscription?.cancel();
      eventSubscription = null;
      setState(() {
        _count = 0;
      });
    });
  }
}
