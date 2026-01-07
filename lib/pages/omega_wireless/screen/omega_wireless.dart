import 'package:alpha/pages/omega_wireless/widgets/omega_widget.dart';
import 'package:alpha/widgets/appbar.dart';
import 'package:alpha/widgets/drawer.dart';
import 'package:flutter/material.dart';

class OmegaWirelessScreen extends StatefulWidget {
  const OmegaWirelessScreen({super.key});

  @override
  State<OmegaWirelessScreen> createState() => _OmegaWirelessScreenState();
}

class _OmegaWirelessScreenState extends State<OmegaWirelessScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                OmegaWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
