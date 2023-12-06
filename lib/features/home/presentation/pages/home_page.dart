import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/index.dart';
import 'package:espot_power/features/home/bloc/home_cubit.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingMixin {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CText(
          text: LocaleKeys.logout_tile.tr(),
          onTap: () => _homeCubit.logout(),
        ),
      ),
    );
  }
}
