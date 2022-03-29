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
  var total = 3;
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];

  addOne() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 버튼 추가
      floatingActionButton: FloatingActionButton(
        child: Text(total.toString()),
        onPressed: (){
          // Dialog는 부모(context)중에 MaterialApp이 있어야 사용 가능
          showDialog(context: context, builder: (context){
            return DialogUI(addOne: addOne);
          });
        },
      ),
      appBar: AppBar(title: Text(total.toString())),
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
  DialogUI({Key? key, this.addOne}) : super(key: key);
  final addOne;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        width: 300,
        height: 300,
        child: Column(
          children: [
            // Controller를 사용하면 입력한 데이터가 자동으로 inputData에 저장됨
            TextField(controller: inputData),
            // Controller 보다 좀 더 직관적으로 값을 저장할 때 onChanged 사용 (TextField가 좀 많은 경우 사용)
            // TextField(onChanged: (text){print(text);}),
            TextButton(
              // step4. 부모에게 받은 state 사용
              child: Text('완료'),
              onPressed: (){
                addOne();
              },
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
