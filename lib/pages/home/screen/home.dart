import 'package:flutter/material.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/drawer.dart';
import '../../../widgets/footer.dart';
import '../widgets/hero.dart';
import '../widgets/safeguard.dart';
import '../widgets/snapshot.dart';
import '../widgets/tradealpha.dart';
import '../widgets/joinus.dart';

/// Alpha Protocol - Home Page
class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: const SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroWidget(),
              Safeguard(),
              Snapshot(),
              TradeAlpha(),
              JoinUs(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
