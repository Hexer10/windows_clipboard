import 'dart:ffi';

import 'clipboard_format.dart';
import 'dlls.dart';

final _isClipboardFormatAvailableFunc =
    user32.lookupFunction<Uint8 Function(Uint16), int Function(int)>(
        'IsClipboardFormatAvailable');

/// Determines whether the clipboard contains data in the specified format.
/// See [ClipboardFormat]
bool isClipboardFormatAvailable(int format) {
  return _isClipboardFormatAvailableFunc(format) == 0 ? false : true;
}
