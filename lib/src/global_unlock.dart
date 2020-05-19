import 'dart:ffi';

import 'dlls.dart';

typedef GlobalUnlockC = Uint8 Function(Pointer mem);
typedef GlobalUnlockDart = int Function(Pointer mem);

final _globalUnlockFunc =
    kernel32.lookupFunction<GlobalUnlockC, GlobalUnlockDart>('GlobalUnlock');

/// Decrements the lock count associated with a memory object
/// that was allocated with GMEM_MOVEABLE.
/// This function has no effect on memory objects allocated with GMEM_FIXED.
bool globalUnlock(Pointer mem) {
  return _globalUnlockFunc(mem) == 0 ? false : true;
}
