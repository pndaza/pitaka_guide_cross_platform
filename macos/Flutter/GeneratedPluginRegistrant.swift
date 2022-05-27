//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import device_info_plus_macos
import native_pdf_renderer
import pdf_render
import shared_preferences_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  DeviceInfoPlusMacosPlugin.register(with: registry.registrar(forPlugin: "DeviceInfoPlusMacosPlugin"))
  NativePdfRendererPlugin.register(with: registry.registrar(forPlugin: "NativePdfRendererPlugin"))
  SwiftPdfRenderPlugin.register(with: registry.registrar(forPlugin: "SwiftPdfRenderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
}
