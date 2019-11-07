import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/company_apply.dart';
import 'package:project_navonmesh/api/company_check.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/values/colors.dart';

class CompanyDetails extends StatefulWidget {
  String imagePath;
  String name;
  String location;
  String no_posts;
  List<String> posts;
  String stipend;
  List<String> screening;
  bool resigtrationStatus;

  CompanyDetails(
      {this.imagePath,
      this.name,
      this.location,
      this.no_posts,
      this.posts,
      this.screening,
      this.stipend,
      this.resigtrationStatus});

  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  Future<String> _future;

  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CompanyCheck().checkStatus(company: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.resigtrationStatus);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FutureBuilder(
                  future: _future,
                  builder: (context, response) {
                    if (response.connectionState == ConnectionState.done) {
                      return Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: widget.name.toLowerCase()=="ikshate"?Container():Image.asset(widget.imagePath),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Company location-"+widget.location,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24.0),
                                    textAlign: TextAlign.center,

                                  ),
                                ),
                                Text(
                                  "Posts available-" + widget.no_posts,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24.0),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0,left: 8.0,right: 8.0),
                                  child: Text(
                                    "Types of posts",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                        color: Colors.white, fontSize: 24.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                      itemCount: widget.posts.length,
                                      itemBuilder: (context,index){
                                        return Text(
                                          widget.posts[index],
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 24.0),
                                          textAlign: TextAlign.center,
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 8.0,right: 8.0),
                                  child: Text(
                                    "Stipend-" + widget.stipend,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0,left: 8.0,right: 8.0),
                                  child: Text(
                                    "Screening process",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white, fontSize: 24.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: widget.screening.length,
                                      itemBuilder: (context,index){
                                        return Text(
                                          widget.screening[index],
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 24.0),
                                          textAlign: TextAlign.center,
                                        );
                                      }),
                                ),
                                Container(
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder:(context){
                              return GestureDetector(
                              child: Container(
                                child: Align(
                                  alignment: Alignment(1, 1.02),
                                  child: ButtonTheme(
                                    minWidth: HomepageCardsizeApi(context).screenWidth,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        RaisedButton(
                                            child: Text(
                                              response.data=="not applied"||response.data=="Not registered"
                                                  ? "Apply"
                                                  : "Withdraw",
                                              style: TextStyle(
                                                  color: ColorValues.COLOR_FLAGSHIP_DARK,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 24.0),
                                            ),
                                            disabledColor:
                                            ColorValues.COLOR_ICON_FLAGSHIP,
                                            onPressed: null,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.only(
                                                    topRight: Radius.circular(16.0),
                                                    topLeft: Radius.circular(16.0)))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                print(widget.resigtrationStatus);
                                widget.resigtrationStatus?regEventCall(widget.name):Scaffold.of(context).showSnackBar(SnackBar(content: Text("You need to register for Internmela first"),));

                              },
                            );}
                          ),
                        ],
                      );
                    } else
                      return Center(child: CircularProgressIndicator());
                  })),
        ],
      ),
    );
  }

  regEventCall(String name) async {
    await CompanyApply().apply(company: name);
      setState(() {
        _future =  CompanyCheck().checkStatus(company: name);
      });
  }
}
