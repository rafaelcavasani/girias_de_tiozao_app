import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlert {

	static buildShowDialog(BuildContext context, String title, String text, String buttonText) async {
	  	showDialog<void>(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context) {
				return AlertDialog(
					title: Text(title),
					content: SingleChildScrollView(
						child: ListBody(
							children: <Widget>[
								Text(text),
								],
						),
					),
					actions: <Widget>[
						FlatButton(	
							child: Text(buttonText),
							onPressed: () {
								Navigator.of(context).pop();
							},
						),
					],
				);
			}
		);
	}
}