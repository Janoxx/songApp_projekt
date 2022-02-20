// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:songapp_projekt/providers/api_provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // --- InitState---
  // @override
  // void initState() {
  //   super.initState();
  //   APIProvider().getRequest();
  //}
  String stringData = "hier gibt es nichts zu sehen";

  Future<List<dynamic>> test(){
    return APIProvider().getRequest();
  }

  Future<void> refresh(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    await APIProvider().getRequest();

    setState(() {
      TestPage();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Developer Test-Seite'),
      ),
      body: ListView(
        children: [
          ElevatedButton(onPressed: (){refresh(context);}, child: Text("Hortler"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red))),
          FutureBuilder<List<dynamic>>(
            future: test(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              else {
                return Text(snapshot.data[0].toString());
              }
            }
            ),
           ],
      )
      

        
    );
  }

  /*  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Developer Test-Seite'),
      ),
      body: Container(
        child: FutureBuilder(
            future: APIProvider().getRequest(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Text(
                        "Request-Output: \n\n " + snapshot.data.toString());
                  },
                ); 
              }
            }),
      ),
    );
  } */

}
