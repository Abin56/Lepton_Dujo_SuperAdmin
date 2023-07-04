import 'package:dujo_super_admin/lepton_Admin/admin_panel_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'lepton_Admin/admin_home_screen.dart';
import 'lepton_Admin/list_of_schools/list_of_schools_screen.dart';
import 'lepton_Admin/requested_list/req_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(1536, 792),
        builder: (context, child) {
          return GetMaterialApp(
          routes: {
          LeptonAdminLoginScreen.route: (context) => LeptonAdminLoginScreen(),
          LeptonHomePage.route: (context) => const LeptonHomePage(),
          SchoolsListScreen.route: (context) => const SchoolsListScreen(),
          RequestedSchoolsListScreen.route: (context) =>
              RequestedSchoolsListScreen(),
              //           DetailsSchoolsScreen.route: (context) =>
              // DetailsSchoolsScreen(schoolSnap: ),
        },
        title: 'DuJo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF02BB9F),
          primaryColorDark: const Color(0xFF167F67),
        ),
        home:
            //const MobHomePage()
            LeptonAdminLoginScreen());
        });

            
  }
}
