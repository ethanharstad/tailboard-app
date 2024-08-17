import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tailboard_app/repositories/remote_config_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.moreInfo),
              leading: const Icon(Icons.info),
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                if (context.mounted) {
                  showAboutDialog(
                      context: context,
                      applicationName: AppLocalizations.of(context)!.appName,
                      applicationVersion:
                          "${packageInfo.version} Build ${packageInfo.buildNumber}",
                      applicationIcon: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/tailboard_logo.png"),
                      ),
                      applicationLegalese:
                          '\u{a9} ${DateTime.now().year} Strange Developments');
                }
              },
            ),
            ListTile(
              title: const Text("Minimum Version"),
              subtitle: Text(RemoteConfigRepository().getMinimumVersion()),
            ),
          ],
        ),
      ),
    );
  }
}
