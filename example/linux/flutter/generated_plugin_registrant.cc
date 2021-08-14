//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <na_map_tools/na_map_tools_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) na_map_tools_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NaMapToolsPlugin");
  na_map_tools_plugin_register_with_registrar(na_map_tools_registrar);
}
