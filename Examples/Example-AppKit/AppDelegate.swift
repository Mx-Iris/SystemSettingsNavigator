//
//  AppDelegate.swift
//  Examples
//
//  Created by JH on 2024/2/12.
//

import Cocoa
import SystemSettingsNavigator

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


    @IBAction func navigate(_ sender: NSButton) {
        _ = try? SystemSettingsNavigator.shared.navigate(to: .privacySecurity(.fullDiskAccess))
    }
}

