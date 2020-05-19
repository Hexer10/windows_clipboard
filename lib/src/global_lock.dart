import 'dart:ffi';

import 'dlls.dart';

final _globalLockFunc = kernel32.lookupFunction<Pointer Function(Pointer),
    Pointer Function(Pointer)>('GlobalLock');

/// Locks a global memory object and returns a pointer
/// to the first byte of the object's memory block.
Pointer globalLock(Pointer mem) {
  return _globalLockFunc(mem);
}
