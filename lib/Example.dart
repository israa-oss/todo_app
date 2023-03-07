import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class Level1 extends StatelessWidget {
  const Level1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (v) {
            Provider.of<Data>(context, listen: false).changeText(v);
          },
        ),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class Data extends ChangeNotifier {
  String data = 'test data';
  void changeText(String newText) {
    data = newText;
    notifyListeners();
  }
}
