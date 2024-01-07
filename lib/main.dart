import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
<<<<<<< HEAD
<<<<<<< HEAD

import 'view/auth/login_screen.dart';
import 'view/dashboard/dashboard.dart';
import 'view/discount_rates.dart';

import 'viewModel/connectivity_view_model.dart';
=======
import 'package:wilatone_restaurant/view/auth/login_screen.dart';
import 'package:wilatone_restaurant/view/profile_detail_screen.dart';
>>>>>>> hardik-dev
=======
import 'package:wilatone_restaurant/view/all_order_screen.dart';
import 'package:wilatone_restaurant/view/earning_screen.dart';
import 'package:wilatone_restaurant/view/profile_detail_screen.dart';
import 'package:wilatone_restaurant/view/sales_screen.dart';
>>>>>>> hardik-dev

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: GetMaterialApp(
        title: VariablesUtils.appName,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: AssetsUtils.poppins,
        ),
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD
<<<<<<< HEAD
        home: LoginScreen(),
=======
        home: const ProfileDetailScreen(),
>>>>>>> hardik-dev
=======
        home: const EarningScreen(),
>>>>>>> hardik-dev
      ),
    );
  }

  ConnectivityViewModel connectivityViewModel =
      Get.put(ConnectivityViewModel());
}
