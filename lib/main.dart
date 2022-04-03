import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      print(contacts);

      setState(() {
        name = contacts;
      });
      // 연락처에 직접 등록하는 코드
      // var newPerson = Contact();
      // newPerson.givenName = '민수';
      // newPerson.familyName = '김';
      // await ContactsService.addContact(newPerson);


    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      // 앱 설정 화면으로 이동해서 직접 켜줘야함 정책상 거절2번하면 더이상 묻는창이 등장하지 않음
      // openAppSettings();
    }
  }

  // App load 될때 최초 실행
  @override
  void initState() {
    super.initState();
  }

  // state 생성은 단순히 stateful 객체 안에 변수를 선언하면 state 취급
  int total = 3;
  var a = 1;
  List<Contact> name = [];
  var like = [0, 0, 0];

  addName(userName) {
    setState(() {
      name.add(userName);
    });
  }

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
              return DialogUI(addOne: addOne, addName: addName);
            });
          },
        ),
        appBar: AppBar(title: Text(total.toString()), actions: [
          IconButton(onPressed: (){ getPermission(); }, icon: Icon(Icons.contacts))
        ],),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            print(i);
            return ListTile(
              leading: Image.asset('assets/dog.jpeg'),
              title: Text(name[i].givenName ?? '없음'),
            );
          },
        )
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);
  final addOne;
  final addName;

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
                addName(inputData.text);
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
