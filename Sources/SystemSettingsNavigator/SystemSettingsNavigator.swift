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
    public func openSystemSettings(_ pane: SystemSettingsPane, completion: ((Bool) -> Void)? = nil) {
        open(pane.url, completionHandler: completion)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
extension NSWorkspace {
    @discardableResult
    public func openSystemSettings(_ pane: SystemSettingsPane) -> Bool {
        open(pane.url)
    }
}
#endif

#if canImport(SwiftUI)

import SwiftUI

@MainActor @preconcurrency public struct OpenSystemSettingsAction: Sendable {
    @MainActor @preconcurrency public func callAsFunction(_ pane: SystemSettingsPane) {
        #if canImport(UIKit) && targetEnvironment(macCatalyst)
        UIApplication.shared.openSystemSettings(pane)
        #elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
        NSWorkspace.shared.openSystemSettings(pane)
        #endif
    }

    @MainActor @preconcurrency public func callAsFunction(_ pane: SystemSettingsPane, completion: @escaping (_ accepted: Bool) -> Void) {
        #if canImport(UIKit) && targetEnvironment(macCatalyst)
        UIApplication.shared.openSystemSettings(pane) { completion($0) }
        #elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
        let accepted = NSWorkspace.shared.openSystemSettings(pane)
        completion(accepted)
        #endif
    }
}

@preconcurrency private enum OpenSystemSettingsActionKey: EnvironmentKey {
    static let defaultValue: OpenSystemSettingsAction = .init()
}

extension EnvironmentValues {
    @MainActor @preconcurrency public var openSystemSettings: OpenSystemSettingsAction {
        get { self[OpenSystemSettingsActionKey.self] }
        set { self[OpenSystemSettingsActionKey.self] = newValue }
    }
}

#endif
