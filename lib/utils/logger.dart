import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

// https://pub.dev/packages/logger
bool logToFile = false;
late Logger logger;

class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}

// use MyFilter to log out in release mode
class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class MyFileOutput extends LogOutput {
  final File? file;
  final bool overrideExisting;
  final Encoding encoding;
  late IOSink _sink;

  MyFileOutput({
    this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file!.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    event.lines.forEach((element) {_sink.writeln(element); });
  }

  @override
  void destroy() async {
    await _sink.flush();
    await _sink.close();
  }
}

void setLogLevelDebug() async{
  if(logToFile){
    final directory = await getApplicationDocumentsDirectory();

    logger = Logger(
      //filter: MyFilter(), // Use the default LogFilter
      printer: MyPrinter(),
      output: MyFileOutput(
        file: File(directory.path + '/logfile1.txt'),
        overrideExisting: true,
      ),
      level: Level.debug,
    );
  }else{
    logger = Logger(
      //filter: MyFilter(), // Use the default LogFilter
      printer: MyPrinter(),
      output: null, // Use the default LogOutput (-> send everything to console)
      level: Level.debug,
    );
  }
}
