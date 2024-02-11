import XCTest
@testable import SystemSettingsNavigator

final class SystemSettingsNavigatorTests: XCTestCase {
    func testExample() throws {
        try SystemSettingsNavigator.shared.navigate(to: .accessibility(.audio))
    }
}
