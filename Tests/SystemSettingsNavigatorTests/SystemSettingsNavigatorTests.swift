import XCTest
@testable import SystemSettingsNavigator

final class SystemSettingsNavigatorTests: XCTestCase {
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    
    func testExample() throws {
        try SystemSettingsNavigator.shared.navigate(to: .accessibility(.audio))
    }
    
#endif
    
#if canImport(UIKit)
    
    func testExample() throws {
        try SystemSettingsNavigator.shared.navigate(to: .accessibility(.audio)) { result in
            print(result)
        }
        print(UIApplication.shared.canOpenURL(URL(fileURLWithPath: "/Users/JH/Desktop/未命名.md")))
//        UIApplication.shared.open()
    }
    
#endif
}
