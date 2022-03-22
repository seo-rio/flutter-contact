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
        // Title: 제목
        // leading: 왼쪽 아이콘
        // actions: 오른쪽 아이콘 목록
        appBar: AppBar(actions: const [Icon(Icons.star), Icon(Icons.star)],leading: Icon(Icons.star), title: Text('THIS IS APP')),
        body: SizedBox(
          // 스타일링 가능한 버튼
          // child: ElevatedButton(child: Text('글자'), onPressed: (){},),
          // Icon 버튼
          // child: IconButton(icon: Icon(Icons.star), onPressed: (){},),
          // child: Text('Hello',
          //     // 일반 컬러 설정
          //     // style: TextStyle(color: Colors.red),
          //     // Hex 컬러 설정
          //     // style: TextStyle(color: Color(0x000f3123)),
          //     // RGB 컬러 설정
          //     // style: TextStyle(color: Color.fromRGBO(231, 48, 48, 1.0)),
          // ),
        ),
        // Align 옵션으로 원하는 위치에 정렬 시킬 수 있음
        // body: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     width: 150, height: 50, color: Colors.blue,
        //     // Padding, Margin 같은걸 제외한 다른 옵션을 설정할땐 Decoration 사용
        //     // decoration: BoxDecoration(
        //     //   border: Border.all(color: Colors.black)
        //     // ),
        //   ),
        // ),
      ),
    );
  }
}

