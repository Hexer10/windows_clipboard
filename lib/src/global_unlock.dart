import 'dart:ffi';

import 'dlls.dart';

final _globalUnlockFunc = kernel32.lookupFunction<Uint8 Function(Pointer mem),
    int Function(Pointer mem)>('GlobalUnlock');

/// Decrements the lock count associated with a memory object
/// that was allocated with GMEM_MOVEABLE.
/// This function has no effect on memory objects allocated with GMEM_FIXED.
bool globalUnlock(Pointer mem) {
  return _globalUnlockFunc(mem) == 0 ? false : true;
}
