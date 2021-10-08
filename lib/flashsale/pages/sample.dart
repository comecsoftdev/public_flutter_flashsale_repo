import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FsSamplePage extends StatefulWidget {
  FsSamplePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _FsSamplePageState createState() => _FsSamplePageState();
}

class _FsSamplePageState extends State<FsSamplePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      String? temp = env['VAR_NAME'];
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  // Using Extensions
                  Container(
                    padding: EdgeInsets.all(10.w),
                    width: 0.5.sw,
                    height: 200.h,
                    color: Colors.red,
                    child: Text(
                      'My actual width: ${0.5.sw}dp \n\n'
                          'My actual height: ${200.h}dp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  // Without using Extensions
                  Container(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(200),
                    color: Colors.blue,
                    child: Text(
                      'My design draft width: 180dp\n\n'
                          'My design draft height: 200dp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                width: 100.r,
                height: 100.r,
                color: Colors.green,
                child: Text('I am a square with a side length of 100',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(12),
                  ),
                ),
              ),
              Text('Device width:${ScreenUtil().screenWidth}dp'),
              Text('Device height:${ScreenUtil().screenHeight}dp'),
              Text('Actual displaySize : ${MediaQuery.of(context).size}'),
              Text('Device pixel density:${ScreenUtil().pixelRatio}'),
              Text('Bottom safe zone distance:${ScreenUtil().bottomBarHeight}dp'),
              Text('Status bar height:${ScreenUtil().statusBarHeight}dp'),
              Text(
                'The ratio of actual width to UI design:${ScreenUtil().scaleWidth}',
                textAlign: TextAlign.center,
              ),
              Text(
                'The ratio of actual height to UI design:${ScreenUtil().scaleHeight}',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text('System font scaling factor:${ScreenUtil().textScaleFactor}'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'My font size is 16sp on the design draft and will not change with the system.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.nsp,
                    ),
                  ),
                  Text(
                    'My font size is 16sp on the design draft and will change with the system.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.ssp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}