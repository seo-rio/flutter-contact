import 'package:flutter/material.dart';

void main() {
  // 앱을 구동하라는 의미
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // 앱을 생성하기 위한 기본 문법
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          child: ShopItem(),
        ),
      ),
    );
  }
}

// stless로 생성
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 추가할 위젯 내용을 하단에 작성
    return SizedBox(
      child: Text('안녕'),
    );
  }
}

