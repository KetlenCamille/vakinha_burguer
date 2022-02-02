import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_state.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _nameEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

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
                key: _formKey,
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
                    VakinhaTextformfield(
                      label: 'Name',
                      controller: _nameEC,
                      validator: Validatorless.required('Mandatory name.'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                        label: 'E-mail',
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Mandatory e-mail.'),
                          Validatorless.email('Invalid e-mail')
                        ])),
                    SizedBox(
                      height: 50,
                    ),
                    VakinhaTextformfield(
                        label: 'Password',
                        controller: _passwordEC,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Mandatory password.'),
                          Validatorless.min(
                              6, 'Password must contain at least 6 characters.')
                        ])),
                    SizedBox(
                      height: 50,
                    ),
                    VakinhaTextformfield(
                        label: 'Confirm password',
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Mandatory confirm password.'),
                          Validatorless.compare(_passwordEC,
                              'Password is different from confirm password.')
                        ])),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: VakinhaButton(
                      label: 'REGISTER',
                      width: context.width,
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          controller.register(
                              name: _nameEC.text,
                              email: _emailEC.text,
                              password: _passwordEC.text);
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
