import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _channel = IOWebSocketChannel.connect('ws://localhost:8000');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebSocket Demo'),
        ),
        body: StreamBuilder(
          stream: _channel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
