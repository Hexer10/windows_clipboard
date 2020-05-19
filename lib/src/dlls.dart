import 'dart:ffi';

///
final DynamicLibrary user32 = DynamicLibrary.open('user32.dll');

///
final DynamicLibrary kernel32 = DynamicLibrary.open('kernel32.dll');