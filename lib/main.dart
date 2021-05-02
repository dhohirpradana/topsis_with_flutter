import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:topsis_tanaman_hias/Pages/topsis_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: TopsisPage()),
          );
        }
      },
    );
  }
}

// ignore: must_be_immutable
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String version = '';
  getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    // String buildNumber = packageInfo.buildNumber;
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('lib/Assets/image/ic_launcher.png')),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'APLIKASI SPK PENILAIAN',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                'HOYA CARNOSA',
                style: TextStyle(fontSize: 41.6, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              )
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'versi ' + version + ' android',
                        style: TextStyle(fontSize: 14),
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
