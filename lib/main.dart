import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:saikiran_interview_task/global/container.dart';
import 'global/constant.dart';
import 'feed/feed_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
	    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	TextEditingController numberInputController = TextEditingController();
	Country _selectedCountry;

	@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
	    top: true,
	    child: Scaffold(
		    backgroundColor: Colors.white,
		    body: Column(
			    mainAxisAlignment: MainAxisAlignment.center,
			    crossAxisAlignment: CrossAxisAlignment.start,
			    children: <Widget>[
				    Container(
					    margin: EdgeInsets.only(left: 20.0),
					    width: 55.0,
					    height: 55.0,
					    child: Card(
						    clipBehavior: Clip.hardEdge,
						    elevation: 8.0,
						    child: ClipRRect(
							    child: Image.asset(R.image.icon),
						    ),
					    ),
				    ),
				    Padding(
					    padding: EdgeInsets.only(top: 20.0, left: 20.0),
					    child: Text(
						    'Welcome to',
						    style: TextStyle(
								    fontSize: 24.0,
								    fontWeight: FontWeight.bold,
							    color: R.color.dark_grey
						    ),
					    ),
				    ),
				    Padding(
					    padding: EdgeInsets.only(top: 4.0, left: 20.0),
					    child: Text(
						    'HealthNest',
						    style: TextStyle(
								    fontSize: 24.0,
								    fontWeight: FontWeight.bold,
							    color: R.color.dark_grey
						    ),
					    ),
				    ),
				    Padding(
					    padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
					    child: Row(
						    children: <Widget>[
							    Expanded(
								    child: TextFormField(
									    onChanged: (text){
									    	setState(() {

									    	});
									    },
									    decoration: InputDecoration(
											  labelText: "Enter Mobile Number",
										    labelStyle: TextStyle(
												    color: R.color.light_grey
										    ),
										    prefixIcon: CountryPicker(
											    showDialingCode: false,
											    showFlag: true,
											    showName: false,
											    onChanged: (country){
												    setState(() {
													    _selectedCountry = country;
												    });
											    },
											    selectedCountry: _selectedCountry,
										    ),
									    ),
									    keyboardType: TextInputType.number,
									    controller: numberInputController,
								    ),
							    )
						    ],
					    ),
				    ),

				    Padding(
					    padding: EdgeInsets.only(top: 30.0, left: 20.0),
					    child: Text(
						    'We never compromise on security!',
						    style: TextStyle(
								    fontSize: 14.0,
							    color: R.color.light_grey
						    ),
					    ),
				    ),
				    Padding(
					    padding: EdgeInsets.only(left: 20.0, right: 20.0),
					    child: Text(
						    'Help us create a safe place by providing your mobile number to maintain authenticity.',
						    style: TextStyle(
								    fontSize: 14.0,
								    color: R.color.light_grey
						    ),
					    ),
				    ),

				    Align(
					    alignment: Alignment.center,
					    child: Container(
						    width: numberInputController.text.length == 10 ? 250.0 : 150.0,
						    margin: EdgeInsets.only(top: 50.0),
						    child: FlatButton(
							    onPressed: (){
							    	//if(numberInputController.text.length == 10){
							    		openContainer();
								    //}
							    },
							    child: Text('Send OTP',
								    style: TextStyle(
									    color: numberInputController.text.length == 10 ? Colors.white : R.color.light_grey
								    ),
							    ),
							    color: numberInputController.text.length == 10 ? R.color.green : R.color.off_dark_white,
						    ),
					    ),
				    )

			    ],
		    ),
	    ),
    );
  }

  void openContainer(){
		Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
			return AllScreenContainer();
		}));
  }

}
