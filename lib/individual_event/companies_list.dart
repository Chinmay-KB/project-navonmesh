import 'package:flutter/material.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/individual_event/company_details.dart';

class CompaniesList extends StatelessWidget {
  bool registrationStatus;

  CompaniesList(this.registrationStatus);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: 30.0,),
              Center(child: Text("Companies",style: TextStyle(color: Colors.white,fontSize: 30.0),)),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    GestureDetector(
                        child: CompanyCards('assets/images/awalk.png', "Awalk"),
                    onTap: (){
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (context) => CompanyDetails(
                                resigtrationStatus: registrationStatus,
                                name: "Awalk",
                                no_posts: "2",
                                imagePath: 'assets/images/awalk.png',
                                location: "Rourkela",
                                posts: ["Embedded Developer","Full Stack Developer", "Circuit Designer"],
                                stipend: "Based on your performance",
                                screening: ['CV Shortlist', 'Personal Interview'],

                              )));
                    },),
                    GestureDetector(child: CompanyCards('assets/images/clavimate.jpg', "Clavimate"),
                    onTap: (){
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (context) => CompanyDetails(
                                resigtrationStatus: registrationStatus,
                                name: "Clavinmate",
                                no_posts: "decided as per performance",
                                imagePath: 'assets/images/clavimate.jpg',
                                location: "Rourkela",
                                posts: ["App Dev","Video Editing/animation", "Marketing"],
                                stipend: "Based on your performance",
                                screening: ['CV Shortlist','Aptitude Test','Personal Interview'],

                              )));
                    },),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Etrix",
                                    no_posts: "decided as per performance",
                                    imagePath: 'assets/images/etrix.png',
                                    location: "Bhubaneshwar",
                                    posts: ["Full stack developer","React Developer","Machine Learning","Artificial Intelligence"],
                                    stipend: "upto Rs 15000",
                                    screening: ['CV Shortlist','Personal Interview'],

                                  )));
                        },
                        child: CompanyCards('assets/images/etrix.png', "Etrix technologies")),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Fastech",
                                    no_posts: "decided as per performance",
                                    imagePath: 'assets/images/fastech.png',
                                    location: "Rourkela",
                                    posts: ["Graphics designing","Content Writing"],
                                    stipend: "Based on your performance",
                                    screening: ['CV Shortlist','Personal Interview'],

                                  )));
                        },
                        child: CompanyCards('assets/images/fastech.png', "Fastech Fashions")),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Frapp",
                                    no_posts: "decided as per performance",
                                    imagePath: 'assets/images/frapp.png',
                                    location: "Mumbai",
                                    posts: ["Community Executive","Campaign Executive","University Relations Executive"],
                                    stipend: "upto Rs 20000",
                                    screening: ['CV Shortlist','PPT Presentation','Personal Interview'],

                                  )));
                        },
                        child: CompanyCards('assets/images/frapp.png', "Frapp")),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Phoenix",
                                    no_posts: "9",
                                    imagePath: 'assets/images/phoenix.png',
                                    location: "Bhubaneshwar",
                                    posts: ["Full stack dev-6","Mobile App Dev-2","Motion Graphic Designer/Illustrator-1"],
                                    stipend: "Rs 14000",
                                    screening: ['CV Shortlist','MCQ Test','Personal Interview'],

                                  )));
                        },
                        child: CompanyCards('assets/images/phoenix.png', "Phoenix")),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Estino",
                                    no_posts: "2",
                                    imagePath: 'assets/images/estino.jpg',
                                    location: "Rourkela",
                                    posts: ["Digital Marketing","Quality Analyst"],
                                    stipend: "None",
                                    screening: ['CV Shortlist','Personal Interview'],

                                  )));
                        },
                        child: CompanyCards('assets/images/estino.jpg', "Estino Energies")),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Ikshate",
                                    no_posts: "4-5",
                                    imagePath: 'none',
                                    location: "Rourkela",
                                    posts: ["Full stack developer","React Developer","Machine Learning","Artificial Intelligence"],
                                    stipend: "upto Rs 15000",
                                    screening: ['CV Shortlist','Personal Interview'],

                                  )));
                        },
                        child: AltCompanyCards("Ikshate Technologies")),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => CompanyDetails(
                                    resigtrationStatus: registrationStatus,
                                    name: "Humaps",
                                    no_posts: "based on performance",
                                    imagePath: 'assets/images/humaps.jpg',
                                    location: "Rourkela",
                                    posts: ["Node.JS dev","App Dev"],
                                    stipend: "upto Rs 12000",
                                    screening: ['CV Shortlist','MCQ test','Personal Interview'],

                                  )));
                        },
                        child:  CompanyCards('assets/images/humaps.jpg', "Humaps")),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget CompanyCards(String image_path,String company){
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image.asset(image_path)),
          ),
          Text(company,style: TextStyle(color: Colors.white,
              fontSize: 30.0),)
        ],
      ),
    );
  }

  Widget AltCompanyCards(String company){

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding:const EdgeInsets.only(top: 20.0,bottom: 20.0,left: 8.0,right: 8.0),
        child: Center(
          child: Text(company,style: TextStyle(color: Colors.white,
              fontSize: 30.0),),
        ),
      ),
    );
  }
}
