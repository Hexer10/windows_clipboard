import 'dart:ffi';

/// memcpy from C
void memcpy<T extends NativeType>(
    Pointer<T> destination, Pointer<T> source, int len) {
  var dst = destination.cast<Uint8>();
  var src = source.cast<Uint8>();
  dst.asTypedList(len).setAll(0, src.asTypedList(len));
}