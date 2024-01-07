import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/view/general/noInternet_screen.dart';
import 'package:wilatone_restaurant/viewModel/connectivity_view_model.dart';
import '../../common/common_widget/wiletone_text_widget.dart';

class WileStoneWebview extends StatefulWidget {
  const WileStoneWebview(
      {super.key, required this.urlLink, required this.title});
  final String urlLink;
  final String title;
  @override
  State<WileStoneWebview> createState() => _WileStoneWebviewState();
}

class _WileStoneWebviewState extends State<WileStoneWebview> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectivityViewModel>(
      init: ConnectivityViewModel(),
      initState: (_) {
        final connectivityViewModel = Get.find<ConnectivityViewModel>();
        connectivityViewModel.startMonitoring();
      },
      builder: (connectivityViewModel) {
        if (connectivityViewModel.isOnline != null) {
          if (connectivityViewModel.isOnline!) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: ColorUtils.greenColor,
                appBar: AppBar(
                  backgroundColor: ColorUtils.greenColor,
                  title: WileToneTextWidget(
                    title: widget.title,
                    fontSize: 16.sp,
                    color: ColorUtils.white,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                body: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(widget.urlLink)),
                  onLoadStart: (controller, url) async {
                    setState(() {});
                  },
                ),
              ),
            );
          } else {
            return const NoInterNetConnected();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
