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
            // step1. DialogUI('작명': 보낼 state);
            return DialogUI(state: a);
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

class DialogUI extends StatelessWidget {
  // step2. this.state 등록
  const DialogUI({Key? key, this.state}) : super(key: key);
  // 부모가 보낸 state는 read-only가 좋으므로 관습적으로 final을 사용하여 변수 생성
  // step3. state 변수 선언
  final state;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            TextButton(
              // step4. 부모에게 받은 state 사용
              child: Text(state.toString()),
              onPressed: (){},
            ),
            TextButton(
              child: Text('취소'),
              onPressed: (){
              // 현재 페이지 닫기
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
