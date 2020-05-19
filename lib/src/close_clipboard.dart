import 'dart:ffi';

import 'dlls.dart';

final _closeClipboardFunc =
    user32.lookupFunction<Uint8 Function(), int Function()>('CloseClipboard');

/// Closes the clipboard.
/// Returns false is the functions fails.
bool closeClipboard() => _closeClipboardFunc() == 0 ? false : true;
