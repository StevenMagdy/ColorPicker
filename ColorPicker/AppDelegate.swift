//
//  AppDelegate.swift
//  ColorPicker
//
//  Created by Steven on 4/4/21.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var picker: NSColorPanel { NSColorPanel.shared }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    picker.mode = .RGB
    picker.showsAlpha = true
    picker.hidesOnDeactivate = false
    picker.isFloatingPanel = true
    picker.setContentSize(.init(width: 216, height: 312))
    if let appTitle = Bundle.main.infoDictionary?["CFBundleName"] as? String {
      picker.title = appTitle
    }
    picker.isMovableByWindowBackground = true
    picker.becomesKeyOnlyIfNeeded = false
    picker.setTarget(self)
    picker.setAction(#selector(colorDidChange(_:)))
    picker.styleMask.formUnion(.miniaturizable)
    picker.makeKeyAndOrderFront(self)
  }

  @objc
  func colorDidChange(_ picker: NSColorPanel) {
  }

  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return sender.windows.filter { $0.isVisible || $0.isMiniaturized }.isEmpty
  }
}
