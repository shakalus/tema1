import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Curency Converter', ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text1 = "";
  final myController = TextEditingController();

  RegExp digitValidator  = RegExp("[0-9]+");
bool nr=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(


        title: Text(widget.title),
          centerTitle: true,
      ),
      body:

        Column(

          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset('assets/images/1.jpg').image
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: myController,
              onChanged: (text) {
                if(double.parse(text) != null || digitValidator.hasMatch(text)) {
                  setValidator(true);
                } else {
                  setValidator(false);
                }

              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the amount in Euro',
                errorText: nr ? null : 'Please enter a number',
              ),

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
                setState(() {
                  if (double.parse(myController.text) !=null) {
                    text1 = '${(double.parse(myController.text)*4.85).toStringAsFixed(2)} RON';
                  } else {
                    text1 = '';
                  }
                });
              },
              child: Text('CONVERT!')),




              Text(
                text1,
                style: Theme.of(context).textTheme.headline4,
              ),


          ],
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void setValidator(valid){
    setState(() {
   //   nr = valid;
    });
  }
}
