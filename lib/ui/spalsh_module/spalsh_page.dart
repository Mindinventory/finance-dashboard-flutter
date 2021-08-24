import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_dashboard/cubit/theme/theme_cubit.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('SplashPage');
    return Scaffold(
      //backgroundColor: BlocProvider.of<ThemeCubit>(context, listen: false).isLight ? Colors.green : Colors.red,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.color_lens_outlined),
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context, listen: false).changeTheme(
              !BlocProvider.of<ThemeCubit>(context, listen: false).isLight);
        },
      ),
    );
  }
}
