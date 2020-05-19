/// ClipboardFormat wrapper
class ClipboardFormat {
  /// A handle to a bitmap (HBITMAP).
  static final ClipboardFormat bitmap = ClipboardFormat._(2);

  /// A memory object containing a BITMAPINFO structure
  /// followed by the bitmap bits.
  static final ClipboardFormat dib = ClipboardFormat._(8);

  ///A memory object containing a BITMAPV5HEADER structure followed by
  ///the bitmap color space information and the bitmap bits.
  static final ClipboardFormat dibv5 = ClipboardFormat._(17);

  /// Software Arts' Data Interchange Format.
  static final ClipboardFormat dif = ClipboardFormat._(5);

  /* TODO: Add other formats from https://docs.microsoft.com/en-us/windows/win32/dataxchg/standard-clipboard-formats */

  /// Text format.
  /// Each line ends with a carriage return/linefeed (CR-LF) combination.
  /// A null character signals the end of the data.
  /// Use this format for ANSI text.
  static final ClipboardFormat text = ClipboardFormat._(1);

  /// Format id.
  final int format;

  const ClipboardFormat._(this.format);
}
