import 'package:flutter/material.dart';
import 'package:alpha/widgets/drawer.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/footer.dart';
import '../widgets/download_hero.dart';
import '../widgets/benefits_section.dart';
import '../widgets/how_it_works.dart';
import '../widgets/requirements_section.dart';

/// Learn Page - Node Download & Onboarding
///
/// Primary CTA for downloading the Alpha Protocol Node application.
/// Guides users through benefits, installation process, and requirements.
class Information extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DownloadHero(),
            BenefitsSection(),
            HowItWorksSection(),
            RequirementsSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
