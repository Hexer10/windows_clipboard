import 'dart:io';
import 'package:windows_clipboard/windows_clipboard.dart';



void main(List<String> arguments) {
  var lastClip = '';
  while(true) {
    sleep(const Duration(seconds: 3));
    var clip = getClipboardString();
    if (clip == null) {
      continue;
    }
    if (clip == lastClip) {
      continue;
    }
    lastClip = clip;
    print('Clip updated: $lastClip');
  }
}
