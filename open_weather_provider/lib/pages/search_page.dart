import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  String? _city;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    setState(() {
      // 폼이 제출된 이후에는 글자마다 검증을 수행한다.
      autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      Navigator.pop(context, _city!.trim());
    }
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: '도시 이름',
                  hintText: '2글자 이상',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: (input) {
                  if (input == null || input.trim().length < 2) {
                    return '최소 2글자 이상 입력하세요';
                  }
                  return null;
                },
                onSaved: (input) {
                  _city = input;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(
                '날씨 검색',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
