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
      // 이미지 설정법
      // home: Image.asset('dog.jpeg')
      // home: Scaffold(
      //   appBar: AppBar(title: Text('앱임'),),
      //   body: Text('안녕'),
      //   bottomNavigationBar: BottomAppBar(
      //     child: SizedBox( // Row 크기를 정하기 위해 Sized Box로 감쌈
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: const [
      //           Icon(Icons.phone),
      //           Icon(Icons.message),
      //           Icon(Icons.contact_page),
      //         ],
      //       ),
      //     ),
      //   ),
      // )
      home: Scaffold(
        appBar: AppBar(title: Text('THIS IS APP')),
        // Align 옵션으로 원하는 위치에 정렬 시킬 수 있음
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 150, height: 50, color: Colors.blue,
            // Padding, Margin 같은걸 제외한 다른 옵션을 설정할땐 Decoration 사용
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black)
            // ),
          ),
        ),
      ),
    );
  }
}

