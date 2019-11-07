import 'package:project_navonmesh/about.dart';
import 'package:project_navonmesh/faq.dart';
import 'package:project_navonmesh/homepage/homepage.dart';
import 'package:project_navonmesh/individual_event/internmela_form.dart';
import 'package:project_navonmesh/locations.dart';
import 'package:project_navonmesh/login/login_screen.dart';
import 'package:project_navonmesh/login/registration.dart';
import 'package:project_navonmesh/main.dart';
import 'package:project_navonmesh/profile/profile.dart';

import 'login/forgotpassword_dialog.dart';

final routes={
  '/login':(context) => LoginScreen(),
  '/homepage':(context)=>Homepage(),
  '/registration':(context)=>RegistrationScreen(),
  '/main':(context)=>MyApp(),
  '/profile':(context)=>ProfileScreen(),
  '/faq': (context) => Faq(),
  '/location': (context) => Locations(),
  '/about': (context) => About(),
  '/forgot_password': (context) => ForgotPassword(),
  '/internmela_form': (context) => InternMela(),
};