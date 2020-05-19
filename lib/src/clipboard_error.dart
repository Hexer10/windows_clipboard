/// Exception throw when a clipboard operation fails.
class ClipboardException implements Exception {

  /// See [ClipboardErrorId] enum
  final ClipboardErrorId error;

  /// Initialize a [ClipboardException]
  const ClipboardException(this.error);
}

/// Info about the clipboard error.
enum ClipboardErrorId {
  /// The given format is not available
  formatNotAvailable,

  /// The clipboard couldn't be opened
  openClipboardError,

  /// The clipboard couldn't be closed
  closeClipboardError,

  /// The clipboard couldn't be emptied
  emptyClipboardError,

  /// GetClipboardData returned a null pointer
  nullGetClipboardData,

  /// SetClipboardData returned a null pointer
  nullSetClipboardData,

  /// GlobalLock returned a null pointer
  nullGlobalLock,
}
