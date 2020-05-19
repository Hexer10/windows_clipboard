import 'dart:ffi';

import 'clipboard_format.dart';

import 'dlls.dart';

final _setClipboardDataFunc = user32.lookupFunction<
    Pointer Function(Uint16, Pointer),
    Pointer Function(int, Pointer)>('SetClipboardData');

/// Places data on the clipboard in a specified clipboard format.
/// The window must be the current clipboard owner,
/// and the application must have called the OpenClipboard function.
/// See [ClipboardFormat] for the [format] flags
/// [mem] is a handle to the data in the specified format.
Pointer setClipboardData(int format, Pointer mem) =>
    _setClipboardDataFunc(format, mem);
