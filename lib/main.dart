import 'package:flutter/material.dart';

void main() {
  // 앱을 구동하라는 의미
  runApp(MyApp());
}

// stful 사용하여 state 사용 가능한 class 생성
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatefulWidget {
  // 앱을 생성하기 위한 기본 문법
  MyApp ({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // state 생성은 단순히 stateful 객체 안에 변수를 선언하면 state 취급
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 버튼 추가
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          // 버튼을 눌렀을 때 특정 기능을 수행하고 싶으면 onPressed 안에 작성
          onPressed: (){
            // state를 변경하려면 setState 함수를 사용하여 변경
            setState(() {
              a++;
            });
          },
        ),
        appBar: AppBar(title: Text('연락처 앱')),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            print(i);
            return ListTile(
              leading: Image.asset('dog.jpeg'),
              title: Text(name[i]),
            );
          },
        )
      ),
    );
  }
}
