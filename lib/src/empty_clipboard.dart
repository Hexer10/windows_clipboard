import 'dart:ffi';

import 'dlls.dart';

typedef EmptyClipboardC = Uint8 Function();
typedef EmptyClipboardDart = int Function();

final _emptyClipboardFunc = user32
    .lookupFunction<EmptyClipboardC, EmptyClipboardDart>('EmptyClipboard');

/// Empties the clipboard and frees handles to data in the clipboard.
/// Returns false is the functions fails.
bool emptyClipboard() => _emptyClipboardFunc() == 0 ? false : true;
