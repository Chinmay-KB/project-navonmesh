import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:project_navonmesh/api/change_ca.dart';
import 'package:project_navonmesh/api/payment/inno_payment.dart';
import 'package:project_navonmesh/api/userprofile.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/api/widget_sizes/api_profile.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/individual_event/individual_event.dart';
import 'package:project_navonmesh/models/RegistrationStatusModel.dart';
import 'package:project_navonmesh/models/profilemodel.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:project_navonmesh/values/constants.dart';
import 'package:project_navonmesh/values/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel profile = new ProfileModel();
  PaymentResponseModel paymentResponseModel = new PaymentResponseModel();
  TextEditingController caTextFieldController = new TextEditingController();

  List<RegEvents> registeredEvents;
  Future<String> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = UserProfile().getResponse(context);
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    ProfileSize profileSize = new ProfileSize(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            child: Background(),
            tag: 'background',
          ),
          FutureBuilder(
              future: _future,
              builder: (context, response) {
                if (!response.hasError) {
                  if (response.connectionState != ConnectionState.done)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    profile = ProfileModel.fromJson(json.decode(response.data));
                    registeredEvents = profile.result.regEvents;
                    if (profile.result.basicInfo.payment_response != null) {
                      paymentResponseModel = PaymentResponseModel.fromJson(json
                          .decode(profile.result.basicInfo.payment_response));
                    }
                    print(registeredEvents.length);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    color: Color(0xffa29bfe),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      profile.result.basicInfo.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      profile.result.basicInfo.college,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      "Inno id-" +
                                          profile.result.basicInfo.innoId,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ),
                                  profile.result.basicInfo.paid == "0"
                                      ? profile.result.basicInfo.college !=
                                      "NATIONAL INSTITUTE OF TECHNOLOGY"
                                      ? Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child:
                                    Builder(builder: (context) {
                                      return RaisedButton(
                                          onPressed: () {
                                            InnoPayment()
                                                .getResponse(context);
                                          },
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(
                                                4.0),
                                            child: Text(
                                              'Payment',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          textColor: Colors.white,
                                          elevation: 7.0,
                                          shape:
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  12.0)),
                                          color: ColorValues
                                              .COLOR_BUTTON_LOGIN);
                                    }),
                                  )
                                      : Container()
                                      : Container(),
                                  profile.result.basicInfo.payment_response !=
                                      null
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      "Ticket id-" +
                                          paymentResponseModel.ticketId,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  )
                                      : Container(),
                                  profile.result.basicInfo.alloted_hostel !=
                                      null
                                      ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "Alloted Hostel-" +
                                              profile.result.basicInfo
                                                  .alloted_hostel,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 20),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RaisedButton(
                                              onPressed: () {
                                                String url = "";
                                                switch (profile.result.basicInfo
                                                    .alloted_hostel) {
                                                  case "cvr":
                                                    {
                                                      url = Constants.cvr;
                                                    }
                                                    break;
                                                  case "kms":
                                                    {
                                                      url = Constants.kms;
                                                    }
                                                    break;
                                                  case "sd":
                                                    {
                                                      url = Constants.sd;
                                                    }
                                                    break;
                                                  case "vs":
                                                    {
                                                      url = Constants.vs;
                                                    }
                                                    break;
                                                  case "hb":
                                                    {
                                                      url = Constants.hb;
                                                    }
                                                    break;
                                                  case "dba":
                                                    {
                                                      url = Constants.dba;
                                                    }
                                                    break;
                                                  case "mss":
                                                    {
                                                      url = Constants.mss;
                                                    }
                                                    break;
                                                  case "gdb":
                                                    {
                                                      url = Constants.gdb;
                                                    }
                                                    break;
                                                  case "mv":
                                                    {
                                                      url = Constants.mv;
                                                    }
                                                    break;
                                                  case "vk":
                                                    {
                                                      url = Constants.vk;
                                                    }
                                                    break;
                                                  case "ssb":
                                                    {
                                                      url = Constants.ssb;
                                                    }
                                                    break;
                                                }
                                                _launchUrl(url);
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Navigate',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              textColor: Colors.white,
                                              elevation: 7.0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0)),
                                              color: ColorValues
                                                  .COLOR_BUTTON_LOGIN),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                    ),
                                  )
                                      : Container(),
                                  Row(
                                    children: <Widget>[
                                      profile.result.basicInfo.ca_response !=
                                          "0"
                                          ? Text(
                                        "Under CA-" +
                                            profile.result.basicInfo
                                                .ca_response,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,),
                                      )
                                          : Container(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Builder(builder: (context) {
                                          return RaisedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return BackdropFilter(
                                                        filter:
                                                        ImageFilter.blur(
                                                            sigmaX: 10,
                                                            sigmaY: 10),
                                                        child: Dialog(
                                                          child: Container(
                                                            width: HomepageCardsizeApi(
                                                                context)
                                                                .getScreenWidth() *
                                                                0.8,
                                                            height: HomepageCardsizeApi(
                                                                context)
                                                                .getScreenWidth() *
                                                                0.4,
                                                            color: ColorValues
                                                                .BACKGROUND_GRADIENT_3,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  "Enter CA id",
                                                                  style: prefix0
                                                                      .TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                      16),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                      20.0,
                                                                      right:
                                                                      20.0),
                                                                  child:
                                                                  TextField(
                                                                    controller:
                                                                    caTextFieldController,
                                                                    enableInteractiveSelection:
                                                                    true,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .phone,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    autocorrect:
                                                                    false,
                                                                    decoration: InputDecoration(
                                                                        contentPadding: EdgeInsets
                                                                            .only(
                                                                            left: 8.0,
                                                                            right: 8.0,
                                                                            top: 10.0,
                                                                            bottom: 10.0),
                                                                        filled: true,
                                                                        fillColor: ColorValues
                                                                            .COLOR_TEXTFIELD_LOGIN,
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              12),
                                                                          borderSide:
                                                                          BorderSide(
                                                                            width:
                                                                            0,
                                                                            style:
                                                                            BorderStyle
                                                                                .none,
                                                                          ),
                                                                        ),
                                                                        hintStyle: TextStyle(
                                                                            fontSize: 20,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            color: Colors
                                                                                .white)),
                                                                  ),
                                                                ),
                                                                Builder(builder:
                                                                    (context) {
                                                                  return RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        _handleChangeRequest();
                                                                      },
                                                                      child:
                                                                      Padding(
                                                                        padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            4.0),
                                                                        child:
                                                                        Text(
                                                                          'Submit',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .w600,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      textColor:
                                                                      Colors
                                                                          .white,
                                                                      elevation:
                                                                      7.0,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius
                                                                              .circular(
                                                                              12.0)),
                                                                      color: ColorValues
                                                                          .COLOR_BUTTON_LOGIN);
                                                                }),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Text(
                                                  profile.result.basicInfo.ca_response !="0"?'Edit':"Add Under CA ID",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              textColor: Colors.white,
                                              elevation: 7.0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0)),
                                              color: ColorValues
                                                  .COLOR_BUTTON_LOGIN);
                                        }),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ],
                              ),
                              width: profileSize.getInfoRowSize(),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            "Registered Events",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: registeredEvents.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Event(
                                                          registeredEvents[index]
                                                              .eid,
                                                          registeredEvents[index]
                                                              .category))),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            imageUrl: Urls.DOMAIN +
                                                "/" +
                                                registeredEvents[index]
                                                    .imagePath,
                                            placeholder: (context, url) =>
                                            new CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                            new Icon(Icons.error),
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return ClipRRect(
                                                borderRadius:
                                                new BorderRadius.circular(
                                                    8.0),
                                                child: Image(
                                                  image: imageProvider,
                                                  width: HomepageCardsizeApi(
                                                      context)
                                                      .getCardWidth() /
                                                      3,
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: HomepageCardsizeApi(
                                                      context)
                                                      .getCardWidth() /
                                                      1.5,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        bottom: 8.0),
                                                    child: Text(
                                                      registeredEvents[index]
                                                          .title,
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize:
                                                          HomepageCardsizeApi(
                                                              context)
                                                              .getCardTitleSize(),
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: <Widget>[
                                                        detailsButton(
                                                            Icons.date_range,
                                                            "Nov " +
                                                                registeredEvents[
                                                                index]
                                                                    .date
                                                                    .substring(
                                                                    1, 2),
                                                            context),
                                                        detailsButton(
                                                            Icons.access_time,
                                                            registeredEvents[
                                                            index]
                                                                .time,
                                                            context),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                      child: detailsButtonSp(
                                                          Icons.location_on,
                                                          registeredEvents[
                                                          index]
                                                              .venue,
                                                          context),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  }
                } else
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.refresh,
                              size: 32.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _future = UserProfile().getResponse(context);
                              });
                            }),
                        Text(
                          "We've encountered a problem",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  );
              }),
        ],
      ),
    );
  }

  _handleChangeRequest() async {
    if (caTextFieldController.text.isNotEmpty) {
      await ChangeUnderCA().changeCa(context, caTextFieldController.text);
      setState(() {
        _future = UserProfile().getResponse(context);
      });
    } else
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Invalid ID"),
        duration: Duration(seconds: 3),
      ));
  }
}

Widget detailsButton(IconData icons, String details, BuildContext context) {
  var cardsizeApi = HomepageCardsizeApi(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          icons,
          color: ColorValues.COLOR_ICON_FLAGSHIP,
          size: cardsizeApi.getCardIconSize(),
        ),
      ),
      Container(
          width: cardsizeApi.getCardButtonBoxSize() / 2.5,
          child: Text(
            details,
            style: TextStyle(
                color: Colors.white,
                fontSize: cardsizeApi.getCardDetailsSize()),
          ))
    ],
  );
}

Widget detailsButtonSp(IconData icons, String details, BuildContext context) {
  var cardsizeApi = HomepageCardsizeApi(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          icons,
          color: ColorValues.COLOR_ICON_FLAGSHIP,
          size: cardsizeApi.getCardIconSize(),
        ),
      ),
      Text(
        details,
        style: TextStyle(
            color: Colors.white, fontSize: cardsizeApi.getCardDetailsSize()),
      )
    ],
  );
}
