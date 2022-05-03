import 'package:flutter/material.dart';

class asb extends StatefulWidget {
  const asb({Key? key}) : super(key: key);

  @override
  State<asb> createState() => _asbState();
}

class _asbState extends State<asb> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              TextButton(onPressed: (){
              }, child: Text(''))
            ],
          ),
        ),
      ),

    );
  }
}
