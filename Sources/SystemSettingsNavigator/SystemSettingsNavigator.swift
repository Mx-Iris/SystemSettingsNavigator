#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

#if canImport(UIKit) && targetEnvironment(macCatalyst)
import UIKit
#endif

public final class SystemSettingsNavigator {
    public static let shared = SystemSettingsNavigator()

    #if canImport(UIKit) && targetEnvironment(macCatalyst)
    public func navigate(to pane: SystemSettingsPane, completion: ((Bool) -> Void)? = nil) throws {
        let url = try buildURL(for: pane)
        UIApplication.shared.open(url, completionHandler: completion)
    }
    #endif

    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
    @discardableResult
    public func navigate(to pane: SystemSettingsPane) throws -> Bool {
        let url = try buildURL(for: pane)
        let result = NSWorkspace.shared.open(url)
        return result
    }
    #endif

    private func buildURL(for pane: SystemSettingsPane) throws -> URL {
        guard let url = URL(string: pane.urlSchema) else {
            throw SystemSettingsNavigatorError.failedCreateURL(pane)
        }
        return url
    }
}
