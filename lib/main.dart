import 'package:flutter/material.dart';
import 'package:show_toast/toast.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: const TestToastPage(),
    );
  }
}

class TestToastPage extends StatefulWidget {
  const TestToastPage({Key? key}) : super(key: key);

  @override
  State<TestToastPage> createState() => _TestToastPageState();
}

class _TestToastPageState extends State<TestToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                elevation: 0,
              ),
              onPressed: () {
                showToast(message: "hi");
              },
              child: const Center(
                child: Text("show"),
              )),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
              onPressed: () async {
                //mocking api call
                showToast(message: "started");

                await Future.delayed(Duration(seconds: 1));
                closeToast(); // to close previous toast

                showToast(message: "getting there");

                await Future.delayed(Duration(seconds: 2));
                closeToast();

                showToast(message: "successfully registrated");
              },
              child: Center(
                child: Text("Registration"),
              )),
        ],
      ),
    );
  }
}
