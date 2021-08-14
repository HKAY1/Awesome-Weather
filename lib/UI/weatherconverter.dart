import 'package:intl/intl.dart';

String converter(double tem) {
  double t = tem - 273.15;
  return t.toStringAsFixed(2) + '\u00B0C';
}

String minmaxtem(double min, double max) {
  min -= 273.15;
  max -= 273.15;
  return min.toStringAsFixed(2) +
      '\u00B0' +
      ' / ' +
      max.toStringAsFixed(2) +
      '\u00B0 C';
}

String getTime({required int timestamp, required String format}) {
  var time = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat(format);
  return formatter.format(time);
}

String getDate({required int timestamp, required String format}) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat(format);
  return formatter.format(date);
}
