# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(my_flutter_plugin_ffi_library VERSION 0.0.1 LANGUAGES C)

add_library(my_flutter_plugin_ffi SHARED
  "my_flutter_plugin_ffi.c"
)

set_target_properties(my_flutter_plugin_ffi PROPERTIES
  PUBLIC_HEADER my_flutter_plugin_ffi.h
  OUTPUT_NAME "my_flutter_plugin_ffi"
)

target_compile_definitions(my_flutter_plugin_ffi PUBLIC DART_SHARED_LIB)
