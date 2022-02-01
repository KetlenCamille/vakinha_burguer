import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VakinhaAppbar(elevation: 0),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (_, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark)),
                        SizedBox(
                          height: 30,
                        ),
                        VakinhaTextformfield(label: 'E-mail'),
                        SizedBox(
                          height: 30,
                        ),
                        VakinhaTextformfield(label: 'Password'),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: VakinhaButton(
                                width: context.width,
                                onPressed: () {
                                  Get.toNamed('auth/register');
                                },
                                label: 'LOGIN')),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('auth/register');
                              },
                              child: Text(
                                'Register',
                                style: VakinhaUi.textBold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
