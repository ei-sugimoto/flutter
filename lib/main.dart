import 'package:flutter/material.dart';

void main() {
  // �ŏ��ɕ\������Widget
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

// ���X�g�ꗗ��ʗpWidget
class TodoListPage extends StatefulWidget {
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('list'),
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
            return TodoAddPage();
            }),
          );
          if(newListText != null){
            setState((){
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // *** �ǉ����镔�� ***
      appBar: AppBar(
        title: Text('Add list'),
      ),
      // *** �ǉ����镔�� ***
      body: Container(
        // �]����t����
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // �e�L�X�g����
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'input todo string'
              ),
              onChanged: (String value){
                setState(() {
                  _text = value;
                });
              },
            ),
            SizedBox(height: 10),
            Container(
              // ���������ς��ɍL����
              width: double.infinity,
              // ���X�g�ǉ��{�^��
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // background
                    foregroundColor: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: Text('Add list', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // ���������ς��ɍL����
              width: double.infinity,
              // �L�����Z���{�^��
              child: TextButton(
                // �{�^�����N���b�N�������̏���
                onPressed: () {
                  // "pop"�őO�̉�ʂɖ߂�
                  Navigator.of(context).pop();
                },
                child: Text('cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

