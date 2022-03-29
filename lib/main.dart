import 'package:flutter/material.dart';

void main() {
  // Widget에 직접 MaterialApp을 사용하지말고 가장 바깥에 사용
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
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
    return Scaffold(
      // 버튼 추가
      floatingActionButton: FloatingActionButton(
        child: Text(a.toString()),
        onPressed: (){
          // Dialog는 부모(context)중에 MaterialApp이 있어야 사용 가능
          showDialog(context: context, builder: (context){
            return Dialog(child: Text('안녕'));
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
    );
  }
}
