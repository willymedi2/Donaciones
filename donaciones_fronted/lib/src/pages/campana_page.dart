import 'package:flutter/material.dart';

class CampanaPage extends StatefulWidget {
  @override
  _CampanaPageState createState() => _CampanaPageState();
}

class _CampanaPageState extends State<CampanaPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(),
        ),
      ),
    );
  }
}
