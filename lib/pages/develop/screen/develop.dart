import 'package:flutter/material.dart';
import 'package:alpha/widgets/drawer.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/footer.dart';
import '../widgets/dev_hero.dart';
import '../widgets/path_selector.dart';
import '../widgets/quickstart_section.dart';
import '../widgets/tools_grid.dart';
import '../widgets/tutorials_section.dart';
import '../widgets/community_section.dart';

/// Develop Page - Developer Onboarding
///
/// Primary entry point for developers building on Alpha Protocol.
/// Features path selection, quickstart code, tools, tutorials, and community.
class Develop extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Develop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DevHero(),
            PathSelector(),
            QuickstartSection(),
            ToolsGrid(),
            TutorialsSection(),
            CommunitySection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
