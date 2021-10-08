import 'package:flutter/material.dart';

import 'package:comecsoft/components/custom_webview_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/generated/l10n.dart';

enum WebViewType {
  WebViewSearchAddress,
  WebViewNormal,
}

class FSWebViewPage extends StatefulWidget {
  final String title;
  final String initialHost;
  final String initialPath;
  final WebViewType type;

  FSWebViewPage({Key? key,
    required this.title,
    required this.initialHost,
    this.initialPath = '',
    this.type = WebViewType.WebViewNormal,
  }) : super(key: key);

  @override
  _FSWebViewPageState createState() => _FSWebViewPageState();
}

class _FSWebViewPageState extends State<FSWebViewPage> {
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  S? _s;                     //application localization

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            hideSoftKeyboard(context);
          },
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: CustomWebViewWidget(
                  initialHost: widget.initialHost,
                  initialPath: widget.initialPath,
                  jsMsgReceived: _getJSFunction(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: widget.title,
    );
  }

  dynamic _getJSFunction(){
    if (widget.type == WebViewType.WebViewSearchAddress) return _jsMessageReceived;
    else return null;
  }

  void _jsMessageReceived(String message){
    Navigator.of(context).pop(message);
  }
}
