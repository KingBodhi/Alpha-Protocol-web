import 'package:alpha/pages/alpha_go/widgets/beta_access.dart';
import 'package:alpha/widgets/appbar.dart';
import 'package:alpha/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AlphaGoScreen extends StatefulWidget {
  const AlphaGoScreen({super.key});

  @override
  State<AlphaGoScreen> createState() => _AlphaGoScreenState();
}

class _AlphaGoScreenState extends State<AlphaGoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return const SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BetaAccessWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
