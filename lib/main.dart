import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/firebase_options.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/view/modules/organization/settings_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/login_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/settings_tab.dart';
import 'package:orphanagemanagement/view/splash_screen.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/login_preference.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FireStore>(create: (_) => FireStore()),
    ChangeNotifierProvider<ServiceProvider>(create: (_) => ServiceProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getLoggedPrefer();
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print("$isUserLogin llllllllllll");
    // final currentUser = FirebaseAuth.instance.authStateChanges();
    // final uid = FirebaseAuth.instance.currentUser!.uid;
    // // print(currentUser);
    // print(uid);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen()
        // home: SettingsPageOrganization()

        // ),

        // home: CreateCustomeNotificationPageOrphanage(),
        // home: ExplorePageInHomeIndividual(),

        // home:UserSelectionPageIndividualAndOrganization(),
        // home: LoginPageOrphanage(),
        // home: MainPageIndividual(),
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       // if (snapshot.connectionState == ConnectionState.waiting) {
        //       //   return Center(
        //       //     child: CircularProgressIndicator(),
        //       //   );
        //       // }
        //       if (snapshot.hasData) {
        //         String uid = snapshot.data!.uid;
        //         storeInstence.loginUSer(uid);
        //         return const Center(
        //           child:  CircularProgressIndicator(),
        //         );
        //         // print("urrentUserId  lllllllllljjjjjjjjjjjjj");
        //       } else {
        //         // print("$currentUserId llllllllllllllllllll");
        //         return LoginPageOrphanage();
        //       }
        //     }));
        );
  }
}
