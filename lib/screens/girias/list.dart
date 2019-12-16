import 'package:flutter/material.dart';
import 'package:my_first_app/models/slang.dart';
import 'package:my_first_app/screens/girias/form.dart';

const _appBarTitle = 'Gírias de Tiozão';

class SlangListState extends State<SlangList> {

	@override
	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text(_appBarTitle),
			),
			body: FutureBuilder<List<Slang>>(
                initialData: List<Slang>(),
                future: Slang.findAll(),
                builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        break;
                      case ConnectionState.waiting:
                        return Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    CircularProgressIndicator(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Loading...'),
                                    )
                                ],
                            ),
                        );
                        break;
                      case ConnectionState.active:
                        break;
                      case ConnectionState.done:
                        final List<Slang> slangList = snapshot.data;
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(slangList[index].slang),
                                    subtitle: Text(slangList[index].name),
                                );
                            },
                        );
                        break;
                    }
                    return Text('');
                },
            ),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: () {
					Navigator.of(context).push(
						MaterialPageRoute(
							builder: (context) => SlangForm(), 
						)
					).then(
						(savedSlang) => _updateList(savedSlang)
					);
				},
			),
    	);
  	}

	void _updateList(Slang savedSlang) {
		if (savedSlang != null) {
			setState(() {
				widget._slangs.add(savedSlang);
			});
		}
	}

}

class SlangList extends StatefulWidget {
	
	final List<Slang> _slangs = List();

	@override
	State<StatefulWidget> createState() {
		return SlangListState();
	}
}
