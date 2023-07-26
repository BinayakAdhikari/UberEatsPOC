import 'package:firebase_auth/firebase_auth.dart';

import 'package:users_app/models/user_model.dart';

import '../models/directions_details_info.dart';



final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId="";
String cloudMessagingServerToken = "key=AAAAAmXEFUA:APA91bEtdp2rZdxgmr_DZcHSjG--L54syLGZdDn_4HopnknduykEItF_iVBs2EG5HXhLIvxtkOJEX1IxSVIk_STVxMIxEuzOVSMs4p4iwhZ6OKriDWuAxmyVbWk-9mYUa4cgJmIjhlgp";
String userDropOffAddress = "";
String driverCarDetails="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";