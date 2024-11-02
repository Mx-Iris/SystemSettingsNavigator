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
