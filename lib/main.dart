import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'view/auth/login_screen.dart';
import 'viewModel/auth_view_model.dart';
import 'viewModel/connectivity_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
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
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          title: VariablesUtils.appName,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: AssetsUtils.poppins,
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }

  /// ====================== CONTROLLER INITIALIZATION ============================= ///
  ConnectivityViewModel connectivityViewModel =
      Get.put(ConnectivityViewModel());
  AuthViewModel authViewModel =
      Get.put(AuthViewModel());
}
