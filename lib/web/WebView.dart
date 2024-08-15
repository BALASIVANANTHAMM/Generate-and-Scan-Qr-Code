import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App name : ${_packageInfo.appName}'),
            Text('Package name: ${_packageInfo.packageName}'),
            Text('App version : ${_packageInfo.version}'),
            Text('Build number : ${_packageInfo.buildNumber}'),
            Text('Build signature : ${_packageInfo.buildSignature}'),
            _packageInfo.installerStore==null?
            const Text(
                'Installer Version : Not Avail'
            ):Text('Installer Version : ${_packageInfo.installerStore}')
          ],
        ),
      ),
    );
  }
}
