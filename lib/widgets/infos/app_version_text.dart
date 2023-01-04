import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionText extends StatefulWidget {
  final Color? textColor;
  const AppVersionText({super.key, this.textColor});

  @override
  State<AppVersionText> createState() => _AppVersionTextState();
}

class _AppVersionTextState extends State<AppVersionText> {
  PackageInfo? _packageInfo;
  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _packageInfo != null
        ? Column(
            children: [
              Text(
                "Versão: ${_packageInfo?.version}+${_packageInfo?.buildNumber}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: 12, color: widget.textColor),
              ),
              Text(
                (FlavorConfig.instance.variables["api"] as String)
                            .contains("treino") ||
                        (FlavorConfig.instance.variables["api"] as String)
                            .contains("localhost")
                    ? "Treino"
                    : (FlavorConfig.instance.variables["api"] as String)
                            .contains("canary")
                        ? "Canário"
                        : "Produção",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: 12, color: widget.textColor),
              )
            ],
          )
        : const SizedBox();
  }
}
