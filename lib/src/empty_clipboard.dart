import 'dart:ffi';

import 'dlls.dart';

final _emptyClipboardFunc =
user32.lookupFunction<Uint8 Function(), int Function()>('EmptyClipboard');

/// Empties the clipboard and frees handles to data in the clipboard.
/// Returns false is the functions fails.
bool emptyClipboard() => _emptyClipboardFunc() == 0 ? false : true;
