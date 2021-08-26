import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/common_public.dart';
import '../../constant/constant_public.dart';
import '../../cubit/theme/theme_cubit.dart';
import 'widgets/login_textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final eMailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appTheme = BlocProvider.of<ThemeCubit>(context, listen: false).appTheme;

    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: appTheme.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens_outlined, color: appTheme.accentColor),
            onPressed: () {
              BlocProvider.of<ThemeCubit>(context, listen: false).changeTheme(!BlocProvider.of<ThemeCubit>(context, listen: false).isLight);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 30),
                child: LoginTextField(
                  controller: eMailController,
                  textInputType: TextInputType.emailAddress,
                  appTheme: appTheme,
                  hintText: kEmailHint,
                ),
              ),
              LoginTextField(
                controller: passwordController,
                hintText: kPasswordHint,
                obscureText: true,
                appTheme: appTheme,
              ),
              const SizedBox(height: 50),
              Center(
                child: RaisedButton(
                  onPressed: () async {
                    if (eMailController.value.text.isEmpty) {
                      CustomAlert.showAlert(kEmailAlert);
                    } else if (passwordController.value.text.isEmpty) {
                      CustomAlert.showAlert(kPasswordAlert);
                    }
                    //TODO: Login code(Navigate to home screen)
                  },
                  child: const Text(kLogin, style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
