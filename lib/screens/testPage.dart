// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, void_checks
import 'package:flutter/material.dart';
import 'package:songapp_projekt/providers/api_provider.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // --- Init ---
  TextEditingController arg1Controller = TextEditingController(text: globals.arg1);
  TextEditingController arg2Controller = TextEditingController(text: globals.arg2);

  Future getRequest() {
    globals.arg1 = arg1Controller.text;
    globals.arg2 = arg2Controller.text;
    debugPrint(globals.arg1 + " - " + globals.arg2);
    return APIProvider().getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Developer Test-Seite'),
        ),
        body: Column(
          children: [
            Text("- Test API Request - ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: arg1Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Argument 1...',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: arg2Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Argument 2...',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getRequest();
                setState(() {

                });
              },
              child: Text("Sende API Request"),
            ),
            Divider(thickness: 1.5),
            Text("- API-Output - ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: FutureBuilder(
                future: getRequest(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                   return ListView.separated(
                        separatorBuilder: (context, index) => Divider(thickness: 1.5),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int i) {
                          return ListTile(
                            title: Text(snapshot.data[i]["name"]),
                            leading: Icon(Icons.star),
                            onTap: (){
                              debugPrint("Du bist ein fettiger Fähdsag der fett ist und rund ToastBurgerToastMexicanSlimani DOISCHLAND.");
                            },
                          );
                        }
                      );
                  }
                },
              ),
            ),
          ],
        ));
  }
}