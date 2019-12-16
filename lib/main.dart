import 'package:flutter/material.dart';
import 'package:my_first_app/screens/girias/list.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData(
				accentColor: Colors.blueAccent[700],
				buttonTheme: ButtonThemeData(
					buttonColor: Colors.blueAccent[700],
					textTheme: ButtonTextTheme.primary 
				),
			),
			home: Scaffold(
				body: SlangList(),
			)
		);
	}
}