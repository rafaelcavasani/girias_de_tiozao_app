import 'package:flutter/material.dart';
import 'package:my_first_app/components/custom_alert.dart';
import 'package:my_first_app/components/custom_text_field.dart';
import 'package:my_first_app/models/slang.dart';

const _appBarTitle = 'Inserir Gíria';
const _labelName = 'Tiozão';
const _hintName = 'Nome do Tiozão';
const _labelSlang = 'Gíria';
const _hinstSlang = 'Gíria de Tiozão';
const _textConfirmButton = 'Confirmar';

class SlangForm extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		return SlangFormState();
	}
}

class SlangFormState extends State<SlangForm> {
	final TextEditingController _controllerName = TextEditingController();
	final TextEditingController _controllerSlang = TextEditingController();

	Future<void> _saveSlang(BuildContext context) async {
		final String name = _controllerName.text;
		final String slang = _controllerSlang.text;
		if (name != null && name != "" && slang != null && slang != "") {
			Slang savedSlang = Slang(name, slang);
            await Slang.insertOne(savedSlang);
            Navigator.pop(context);
		} else {
			final String title = 'Erro ao salvar a gíria';
			final String text = 'Informe o nome e a gíria do tiozão';
			final String buttonText = 'OK';
			CustomAlert.buildShowDialog(context, title, text, buttonText);
		}
	}

	@override
	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text(_appBarTitle),
			),
			body: SingleChildScrollView(
				child: Column(
					children: <Widget>[
						CustomTextField(controller: _controllerName, label: _labelName, hint: _hintName),
						CustomTextField(controller: _controllerSlang, label: _labelSlang, hint: _hinstSlang),
						Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                                width: double.maxFinite,
                                height: 50,
                                child: RaisedButton(
                                    child: Text(_textConfirmButton),
                                    onPressed: () => _saveSlang(context),
                                ),
                            ),
                        )
					],
        		),
			)
		);
	}
}
