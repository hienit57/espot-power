import 'dart:async';

import 'package:espot_power/features/index.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  late MapCubit _mapCubit;

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.slidingController = StreamController<StatusSliding>();
    _mapCubit.slidingController.add(StatusSliding.middle);
    super.initState();
  }

  @override
  void dispose() {
    _mapCubit.slidingController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const MapWidget(),
          const SearchBarMapWidget(),
          StreamBuilder<StatusSliding>(
              stream: _mapCubit.slidingController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return (() {
                    if (snapshot.data == StatusSliding.initial) {
                      return const Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: InitialSlidingWidget(),
                      );
                    } else if (snapshot.data == StatusSliding.high) {
                      return const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: HighSlidingWidget());
                    }
                    return const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: MiddleSlidingWidget(isEmptyLocation: true),
                    );
                  }());
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
