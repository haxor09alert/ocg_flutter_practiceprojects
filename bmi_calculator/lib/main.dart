import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weightController = TextEditingController();
  var heightInFeetController = TextEditingController();
  var heightInInchController = TextEditingController();

  var Calculate = TextEditingController();

  var result ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yourBMI'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI',style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w600
              ),
              ),
        
              SizedBox(height: 24,),
        
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  label: Text('Enter your weight(kg):' ),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
        
              SizedBox(height: 24,),
        
              TextField(
                controller: heightInFeetController,
                decoration: InputDecoration(
                  label: Text('Enter your Height(ft):' ),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
        
              SizedBox(height: 24,),
              TextField(
                controller: heightInInchController,
                decoration: InputDecoration(
                  label: Text('Enter your height(ft):' ),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16,),

              ElevatedButton(onPressed: (){

                final weight = weightController.text.trim();
                final heightInFeet = heightInFeetController.text.trim();
                final heightInInch = heightInInchController.text.trim();

                if(weight.isNotEmpty && heightInFeet.isNotEmpty && heightInInch.isNotEmpty ){

                  var iWT = int.parse(weight);
                  var iFT = int.parse(heightInFeet);
                  var iInch = int.parse(heightInInch);

                  var tInch = (iFT*12)+ iInch;

                  var tCm = tInch* 2.54;

                  var tM = tCm/100;

                  var bmi = iWT/(tM*tM);

                 setState(() {
                    result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                 });

                }
                else{
                  setState(() {
                    result = "Please fill all the required blanks!!";
                  });
                }


              }, child: Text('Calculate'),),
              SizedBox(height: 8,),

              Text(result, style: TextStyle(fontSize: 20,),)
        
            ],
          ),
        ),
      )
    );
  }
}
