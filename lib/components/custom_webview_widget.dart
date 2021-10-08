import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/constants.dart' as constants;

class CustomWebViewWidget extends StatefulWidget {
  final String initialHost, initialPath;
  // callback function for javascript
  final void Function(String title)? jsMsgReceived;

  const CustomWebViewWidget({
    Key? key,
    required this.initialHost,
    required this.initialPath,
    required this.jsMsgReceived,
  }) : super(key: key);

  @override
  _CustomWebViewWidgetState createState() => _CustomWebViewWidgetState();
}

class _CustomWebViewWidgetState extends State<CustomWebViewWidget> {
  final Completer<WebViewController> _controllerCompleter = Completer<WebViewController>();
  String? _initialHost, _initialPath;
  WebViewController? _controller;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _initialHost = widget.initialHost;
    _initialPath = widget.initialPath;
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: _initialHost! + _initialPath!,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            logger.d('${this.runtimeType} onWebViewCreated');
            _controllerCompleter.complete(webViewController);
            _controller = webViewController;
          },
          javascriptChannels: <JavascriptChannel>[
            _searchAddressJavascriptChannel(context),
          ].toSet(),
          navigationDelegate:  (NavigationRequest request){
            logger.d('${this.runtimeType} allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            logger.d('${this.runtimeType} Page start loading: $url');
            setState(() {
              _loading = true;
            });
          },
          onPageFinished: (String url) {
            logger.d('${this.runtimeType} Page finished loading: $url');
            setState(() {
              _loading = false;
            });
          },
          //gestureNavigationEnabled: true,
        ),
        (_loading) ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),),) : Container(),
      ],
    );
  }

  JavascriptChannel _searchAddressJavascriptChannel(BuildContext context){
    return JavascriptChannel(
      name: 'AddressCompleted',
      onMessageReceived: (JavascriptMessage message) {
        widget.jsMsgReceived?.call(message.message);
      },
    );
  }
}