import 'package:first_app/cubit/app_cubit.dart';
import 'package:first_app/cubit/app_cubit_states.dart';
import 'package:first_app/detail_page.dart';
import 'package:first_app/home_page.dart';
import 'package:first_app/pages/navpages/main_page.dart';
import 'package:first_app/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitsLogic extends StatefulWidget {
  const AppCubitsLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitsLogic> createState() => _AppCubitsLogicState();
}

class _AppCubitsLogicState extends State<AppCubitsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: ((context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          } else if (state is DetailState) {
            return DetailPage();
          } else if (state is LoadedState) {
            return MainPage();
          } else if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
