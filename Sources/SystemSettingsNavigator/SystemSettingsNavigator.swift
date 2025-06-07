#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

#if canImport(UIKit) && targetEnvironment(macCatalyst)
import UIKit
#endif

public final class SystemSettingsNavigator {
    public static let shared = SystemSettingsNavigator()

    #if canImport(UIKit) && targetEnvironment(macCatalyst)
    @available(*, deprecated, renamed: "UIApplication.openSystemSettings(_:completion:)")
    public func navigate(to pane: SystemSettingsPane, completion: ((Bool) -> Void)? = nil) throws {
        UIApplication.shared.open(pane.url, completionHandler: completion)
    }
    #endif

    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
    @discardableResult
    @available(*, deprecated, renamed: "NSWorkspace.openSystemSettings(_:)")
    public func navigate(to pane: SystemSettingsPane) throws -> Bool {
        NSWorkspace.shared.open(pane.url)
    }
    #endif
}

#if canImport(UIKit) && targetEnvironment(macCatalyst)
extension UIApplication {
    @available(*, deprecated, renamed: "UIApplication.openSystemSetting(_:completion:)")
    public func openSystemSettings(_ pane: SystemSettingsPane, completion: ((Bool) -> Void)? = nil) {
        openSystemSetting(pane, completion: completion)
    }

    public func openSystemSetting(_ pane: SystemSettingsPane, completion: ((Bool) -> Void)? = nil) {
        open(pane.url, completionHandler: completion)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
extension NSWorkspace {
    @discardableResult
    @available(*, deprecated, renamed: "NSWorkspace.openSystemSettings(_:)")
    public func openSystemSettings(_ pane: SystemSettingsPane) -> Bool {
        openSystemSetting(pane)
    }

    @discardableResult
    public func openSystemSetting(_ pane: SystemSettingsPane) -> Bool {
        open(pane.url)
    }
}
#endif

#if canImport(SwiftUI)

import SwiftUI

@MainActor @preconcurrency public struct OpenSystemSettingAction: Sendable {
    @MainActor @preconcurrency public func callAsFunction(_ pane: SystemSettingsPane) {
        #if canImport(UIKit) && targetEnvironment(macCatalyst)
        UIApplication.shared.openSystemSetting(pane)
        #elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
        NSWorkspace.shared.openSystemSetting(pane)
        #endif
    }

    @MainActor @preconcurrency public func callAsFunction(_ pane: SystemSettingsPane, completion: @escaping (_ accepted: Bool) -> Void) {
        #if canImport(UIKit) && targetEnvironment(macCatalyst)
        UIApplication.shared.openSystemSetting(pane) { completion($0) }
        #elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
        let accepted = NSWorkspace.shared.openSystemSetting(pane)
        completion(accepted)
        #endif
    }
}

@preconcurrency private enum OpenSystemSettingActionKey: EnvironmentKey {
    static let defaultValue: OpenSystemSettingAction = .init()
}

extension EnvironmentValues {
    @MainActor @preconcurrency public var openSystemSetting: OpenSystemSettingAction {
        get { self[OpenSystemSettingActionKey.self] }
        set { self[OpenSystemSettingActionKey.self] = newValue }
    }
}

#endif
