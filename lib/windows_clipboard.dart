/// Wrapper around the clipboard windows api.
library windows_clipboard;

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'raw_clipboard.dart';

export 'src/clipboard_exception.dart';

/// Get the current clipboard as [String].
/// Throws a [ClipboardException] if this fails.
String getClipboardString() {
  if (!isClipboardFormatAvailable(1)) {
    throw ClipboardException(ClipboardErrorId.formatNotAvailable);
  }

  if (!openClipboard(null)) {
    throw ClipboardException(ClipboardErrorId.openClipboardError);
  }

  var handle = getClipboardData(1);
  if (handle == nullptr) {
    throw ClipboardException(ClipboardErrorId.nullGetClipboardData);
  }

  var lpstr = globalLock(handle).cast<Utf8>();
  if (lpstr == nullptr) {
    closeClipboard();
    throw ClipboardException(ClipboardErrorId.nullGlobalLock);
  }

  globalUnlock(handle);
  if (!closeClipboard()) {
    throw ClipboardException(ClipboardErrorId.closeClipboardError);
  }
  return Utf8.fromUtf8(lpstr);
}

/// Set the current clipboard as [String].
/// Throws a [ClipboardException] if this fails.
void setClipboardString(String str) {
  if (!openClipboard(null)) {
    throw ClipboardException(ClipboardErrorId.openClipboardError);
  }

  if (!emptyClipboard()) {
    throw ClipboardException(ClipboardErrorId.emptyClipboardError);
  }

  var len = str.length + 1;
  var mem = allocate<Utf8>(count: len);
  memcpy(mem, Utf8.toUtf8(str), len);

  if (setClipboardData(1, mem) == nullptr) {
    closeClipboard();
    throw ClipboardException(ClipboardErrorId.nullSetClipboardData);
  }

  if (!closeClipboard()) {
    throw ClipboardException(ClipboardErrorId.closeClipboardError);
  }
}
