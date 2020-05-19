import 'dart:ffi';



import 'dlls.dart';

final _getClipboardDataFunc = user32.lookupFunction<
    Pointer Function(Uint16),
    Pointer Function(int)>('GetClipboardData');

/// Retrieves data from the clipboard in a specified format.
/// The clipboard must have been opened previously.
Pointer getClipboardData(int format) {
  return _getClipboardDataFunc(format);
}
