import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saikiran_interview_task/feed/feed_screen.dart';

import 'constant.dart';

class AllScreenContainer extends StatelessWidget {

 var screens = [
 	 FeedScreen(),
	 FeedScreen(),
	 Container(),
	 FeedScreen(),
	 FeedScreen(),
 ];

 PageController _pageController = PageController(
		 initialPage: 0
 );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
	    top: true,
	    child: Scaffold(
		    body: PageView(
			    controller: _pageController,
			    physics: NeverScrollableScrollPhysics(),
			    children: screens,
		    ),
		    bottomNavigationBar: getBottomAppBar(context),
	    ),
    );
  }

  Widget getBottomAppBar(BuildContext context){
  	return Container(
		  height: 70.0,
		  child: Center(
			  child: BottomAppBar(
				  child: Row(
					  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
					  children: <Widget>[
						  Container(
							  width: 56.0,
							  child: Center(
								  child: Stack(
									  children: <Widget>[
										  Column(
											  mainAxisAlignment: MainAxisAlignment.center,
											  children: <Widget>[
												  getIcons(context, R.image.dashboard, 24.0, 24.0),
												  Padding(
													  padding: EdgeInsets.only(top: 4.0),
													  child: Text(
														  'Feed',
														  style: TextStyle(
																  fontSize: 12.0,
																  fontWeight: FontWeight.bold,
																  color: R.color.light_grey
														  ),
														  textAlign: TextAlign.center,
													  ),
												  )
											  ],
										  ),
										  Positioned(
											  top: 6.0,
											  right: 0,
											  child: Container(
												  padding: EdgeInsets.all(1),
												  decoration: BoxDecoration(
													  color: Colors.red,
													  borderRadius: BorderRadius.circular(6),
												  ),
												  constraints: BoxConstraints(
													  minWidth: 12,
													  minHeight: 12,
												  ),
											  ),
										  )
									  ],
								  ),
							  ),
						  ),
						  Container(
							  width: 56.0,
							  child: Column(
								  mainAxisAlignment: MainAxisAlignment.center,
								  children: <Widget>[
									  getIcons(context, R.image.library, 24.0, 24.0),
									  Padding(
										  padding: EdgeInsets.only(top: 4.0),
										  child: Text(
											  'Library',
											  style: TextStyle(
													  fontSize: 12.0,
													  fontWeight: FontWeight.bold,
													  color: R.color.light_grey
											  ),
											  textAlign: TextAlign.center,
										  ),
									  )
								  ],
							  ),
						  ),
						  Container(
							  width: 36.0,
							  height: 36.0,
							  child: FloatingActionButton(
								  backgroundColor: R.color.green,
								  onPressed: (){

								  },
								  child: Icon(Icons.add, color: Colors.white,),
							  ),
						  ),
						  Container(
							  width: 56.0,
							  child: Column(
								  mainAxisAlignment: MainAxisAlignment.center,
								  children: <Widget>[
									  getIcons(context, R.image.messages, 24.0, 24.0),
									  Padding(
										  padding: EdgeInsets.only(top: 4.0),
										  child: Text(
											  'Messages',
											  style: TextStyle(
													  fontSize: 12.0,
													  fontWeight: FontWeight.bold,
													  color: R.color.light_grey
											  ),
											  textAlign: TextAlign.center,
										  ),
									  )
								  ],
							  ),
						  ),
						  Container(
							  width: 54.0,
							  child: Column(
								  mainAxisAlignment: MainAxisAlignment.center,
								  children: <Widget>[
									  getIcons(context, R.image.services, 24.0, 24.0),
									  Padding(
										  padding: EdgeInsets.only(top: 4.0),
										  child: Text(
											  'Services',
											  style: TextStyle(
													  fontSize: 12.0,
													  fontWeight: FontWeight.bold,
													  color: R.color.light_grey
											  ),
											  textAlign: TextAlign.center,
										  ),
									  )
								  ],
							  ),
						  ),
					  ],
				  ),
			  ),
		  ),
	  );
  }

 Widget getIcons(BuildContext context, String iconPath, width, height) {
	 return Container(
		 width: width,
		 height: height,
		 decoration: new BoxDecoration(
			 shape: BoxShape.rectangle,
			 image: new DecorationImage(
					 fit: BoxFit.fill, image:
			 AssetImage(iconPath)
				 /*new NetworkImage("https://i.imgur.com/BoN9kdC.png"),*/
			 ),
		 ),
	 );
 }

}

