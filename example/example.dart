import 'package:windows_clipboard/windows_clipboard.dart';

void main() {
//  var currentValue = getClipboardString();
//  print('Current clipboard: $currentValue');
  var clip = 'Hello world';
  setClipboardString(clip);
//  var newValue = getClipboardString();
//  print('New clipboard: $newValue');
}
