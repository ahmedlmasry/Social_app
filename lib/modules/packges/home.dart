import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text(translator.translate('appBarTitle')),
      ),
      body: Center(
          child: InkWell(
        onTap: () {
          translator.currentLanguage == 'ar'
              ? translator.setNewLanguage(context,
                  newLanguage: 'en', restart: true)
              : translator.setNewLanguage(context,
                  newLanguage: 'ar', restart: true);
        },
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.teal),
          child: Center(
            child: Text(
              translator.currentLanguage == 'ar' ? 'En' : 'Ar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      )),
    );
  }
}
