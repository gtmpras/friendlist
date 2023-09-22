import 'package:flutter/material.dart';
import 'package:friend_request/friends_request.dart';
import 'package:friend_request/provider/friend_request_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> FriendRequestProvider() )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FriendRequest(),
    ),
    );
  }
}