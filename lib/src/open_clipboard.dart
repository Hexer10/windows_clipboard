import 'dart:ffi';

import 'dlls.dart';

final _openClipboardFunc =
    user32.lookupFunction<Uint8 Function(Pointer), int Function(Pointer)>(
        'OpenClipboard');

/// Opens the clipboard for examination and prevents other applications
/// from modifying the clipboard content.
/// After this [closeClipboard] should be called.
/// Returns false if this fails.
bool openClipboard([Pointer handle]) {
  handle ??= nullptr;
  return _openClipboardFunc(handle) == 0 ? false : true;
}
