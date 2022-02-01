import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VakinhaAppbar(elevation: 0),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Register',
                        style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark)),
                    Text(
                        'Fill in the fields below to create your registration.',
                        style: context.textTheme.bodyText1),
                    SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(label: 'Name'),
                    SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(label: 'E-mail'),
                    SizedBox(
                      height: 50,
                    ),
                    VakinhaTextformfield(label: 'Password'),
                    SizedBox(
                      height: 50,
                    ),
                    VakinhaTextformfield(label: 'Confirm password'),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: VakinhaButton(
                            width: context.width,
                            onPressed: () {},
                            label: 'REGISTER')),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
