import 'package:flutter/material.dart';
import 'package:saikiran_interview_task/feed/all_posts_model.dart';
import 'package:saikiran_interview_task/global/read_more_text.dart';
import 'package:saikiran_interview_task/global/utils.dart';

import '../global/constant.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  var _communitiesArray = ["All Communities", "Diet", "Operations", "Doctor Ethics"];

  var _selected = "All Communities";

  var _postsList = List<AllPostModel>();

  var _visibleView = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected = _communitiesArray[0];
    loadPostsList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: R.color.background_grey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 186.0,
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20.0, left: 18.0),
                              child: Text(
                                'Community',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: R.color.light_grey
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  value: _selected,
                                  items: _communitiesArray.map((String selectedString){
                                    return DropdownMenuItem(
                                      child: Text(
                                        selectedString,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: R.color.green
                                        ),
                                      ),
                                      value: selectedString,
                                    );
                                  }).toList(),
                                  onChanged: (selectedItem){
                                    selectedCommunity(selectedItem);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        getProfileDetails(context)
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 14.0, right: 10.0),
                              height: 34.0,
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: R.color.light_green,
                                  primaryColorDark: R.color.green
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0, right: 6.0, left: 6.0),
                                    focusedBorder: borderTextField(),
                                    border: borderTextField(),
                                    enabledBorder: borderTextField(),
                                    disabledBorder: borderTextField(),
                                    hintText: "Search Posts And Comments",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Icon(Icons.notifications),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.only(top: 14.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          AllPostModel allPostModel = _postsList[index];
                          return Container(
                            width: 76.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: R.color.light_green_text),
                              borderRadius: BorderRadius.circular(20.0),
                              color: allPostModel.selected ? R.color.light_green_text : Colors.white
                            ),
                            margin: EdgeInsets.only(left: index == 0 ? 14.0 : 7.0, right: index == _postsList.length - 1 ? 14.0  : 7.0, top: 2.0, bottom: 2.0),
                            child: Center(
                              child: Text(allPostModel.text, style: TextStyle(color: R.color.green),),
                            ),
                          );
                        },
                        itemCount: _postsList.length,
                      ),
                    )
                  ],
                ),
              ),
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(top: 14.0, bottom: index == 4 ? 14.0 : 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'DIET',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: R.color.light_grey
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  '1 min',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black
                                  ),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      getProfileList(context),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                  text: 'rohit.shetty12',
                                                  style: TextStyle(
                                                      fontSize: 15.0, fontWeight: FontWeight.w700, color: R.color.dark_grey),
                                                  children:<TextSpan>[
                                                    TextSpan(text: ' asked a question',
                                                        style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: R.color.light_grey)),
                                                  ]
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 4.0),
                                              child: Text("Diagnosed Recently".toUpperCase(), style: TextStyle(color: R.color.green, fontSize: 13.0),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  getOptions(context)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14.0),
                              child: Text(
                                'What are the signs and symptoms of skin cancer?',
                                style: TextStyle(
                                    fontSize: 22.0, fontWeight: FontWeight.w700, color: R.color.dark_grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: ReadMoreText(
                                  'I’ve been facing a few possibble symptoms of skin cancer. I’ve googled the possibilities but i thought i’d ask the community instead.',
                                  colorClickableText : R.color.dark_grey,
                                  style: TextStyle(
                                      fontSize: 18.0, color: R.color.dark_grey),
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                trimCollapsedText: "...See More",
                                trimExpandedText: "...See Less",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.0, left: 6.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 13.0,
                                    color: R.color.green,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.0, top: 1.0),
                                    child: Text("Peninsula Park, Andheri, Mumbai".toUpperCase(), style: TextStyle(color: R.color.green, fontSize: 10.0),),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Divider(
                                color: R.color.divider,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.0),
                                    child: Stack(
                                      children: <Widget>[
                                        getInterestedProfile(context),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: getInterestedProfile(context),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 40.0),
                                          child: getInterestedProfile(context),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text("24 members have this question", style: TextStyle(color: R.color.dark_grey, fontSize: 13.0),),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Divider(
                                color: R.color.divider,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 6.0, left: 20.0, right: 20.0),
                              height: 24.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onLongPress: (){
                                      setState(() {
                                        _visibleView = true;
                                      });
                                    },
                                    onLongPressEnd: (longPress){
                                      setState(() {
                                        _visibleView = false;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        getIcons(context, R.image.like_not_selected, 18.0, 18.0),
                                        Padding(
                                          padding: EdgeInsets.only(left: 4.0),
                                          child: Text(
                                              '24',
                                              style: TextStyle(
                                                  fontSize: 14.0, fontWeight: FontWeight.w700, color: R.color.dark_grey)
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      getIcons(context, R.image.group_not_selected, 17.0, 17.0),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Text(
                                            '40',
                                            style: TextStyle(
                                                fontSize: 14.0, fontWeight: FontWeight.w700, color: R.color.dark_grey)
                                        ),
                                      )
                                    ],
                                  ),
                                  getIcons(context, R.image.save_not_selected, 16.0, 18.0),
                                  getIcons(context, R.image.share, 18.0, 18.0)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _visibleView,
                          child: Positioned(
                            bottom: 40.0,
                            child: Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26.0)
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            getIcons(context, R.image.like_selected, 20.0, 20.0),
                                            Padding(
                                              padding: EdgeInsets.only(left: 4.0),
                                              child: Text(
                                                  'Like',
                                                  style: TextStyle(
                                                      fontSize: 14.0, color: R.color.dark_grey)
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: <Widget>[
                                              getIcons(context, R.image.happy, 20.0, 20.0),
                                              Padding(
                                                padding: EdgeInsets.only(left: 4.0),
                                                child: Text(
                                                    'Haha',
                                                    style: TextStyle(
                                                        fontSize: 14.0, color: R.color.dark_grey)
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: <Widget>[
                                              getIcons(context, R.image.sad, 20.0, 20.0),
                                              Padding(
                                                padding: EdgeInsets.only(left: 4.0),
                                                child: Text(
                                                    'Sad',
                                                    style: TextStyle(
                                                        fontSize: 14.0, color: R.color.dark_grey)
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }, childCount: 5),
            )
          ],
        ),
      ),
    );
  }

  void selectedCommunity(String communitySelected){
    setState(() {
      _selected = communitySelected;
    });
  }

  Widget getProfileDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.0),
      width: 36.0,
      height: 36.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
            fit: BoxFit.fill, image:
        AssetImage(R.image.placeHolder)
          /*new NetworkImage("https://i.imgur.com/BoN9kdC.png"),*/
        ),
      ),
    );
  }

  Widget getProfileList(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
            fit: BoxFit.fill, image:
        AssetImage(R.image.placeHolder)
          /*new NetworkImage("https://i.imgur.com/BoN9kdC.png"),*/
        ),
      ),
    );
  }

  Widget getInterestedProfile(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
            fit: BoxFit.fill, image:
        AssetImage(R.image.placeHolder)
          /*new NetworkImage("https://i.imgur.com/BoN9kdC.png"),*/
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

  Widget getOptions(BuildContext context) =>
      PopupMenuButton<int>(itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Option 1"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Option 2"),
        )
      ], icon: Icon(Icons.more_vert, size: 20.0,),onSelected: (value){
        //_displayDialogReasonGroup(context, groupId);
      },);

  void loadPostsList(){

    AllPostModel allPostModel = AllPostModel();
    allPostModel.text = "All Posts";
    allPostModel.selected = true;
    _postsList.add(allPostModel);

    AllPostModel newsModel = AllPostModel();
    newsModel.text = "News";
    newsModel.selected = false;
    _postsList.add(newsModel);

    AllPostModel dietModel = AllPostModel();
    dietModel.text = "Diet";
    dietModel.selected = false;
    _postsList.add(dietModel);

    AllPostModel lifestyleModel = AllPostModel();
    lifestyleModel.text = "Lifestyle";
    lifestyleModel.selected = false;
    _postsList.add(lifestyleModel);

    AllPostModel symtomsModel = AllPostModel();
    symtomsModel.text = "Symptoms";
    symtomsModel.selected = false;
    _postsList.add(symtomsModel);

  }

}

/*[
                ,
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
                ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),

              ]*/