import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/bindings/application_binding.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/routes/auth_routes.dart';
import 'package:vakinha_burguer_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/order_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/product_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurguerMainApp());
}

class VakinhaBurguerMainApp extends StatelessWidget {
  const VakinhaBurguerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VakinhaBurguer',
      theme: VakinhaUi.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrderRouters.routers
      ],
    );
  }
}
