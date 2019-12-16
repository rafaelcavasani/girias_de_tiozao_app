import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

	final TextEditingController controller;
	final String label;
	final String hint;
	final IconData icon;

	CustomTextField({this.controller, this.label, this.hint, this.icon});

	@override
	Widget build(BuildContext context) {
		return
			Padding(
				padding: const EdgeInsets.all(20.0),
				child: TextField(
					controller: controller,
					style: TextStyle(
						fontSize: 24.0,
					),
					decoration: InputDecoration(
						icon: this.icon != null ? Icon(this.icon) : null,
						labelText: this.label,
						hintText: this.hint
					),
					keyboardType: TextInputType.text,
				),
			);
	}

}