import XCTest

final class MyFirstAppUITests: XCTestCase {
    func testProfileScreenAndFollowButton() throws {
        let app = XCUIApplication()
        app.launch()

        // Vérifie que le nom s'affiche bien
        let nameLabel = app.staticTexts["Jeff Bezos"]
        XCTAssertTrue(nameLabel.exists)

        // Vérifie que le bouton Follow est présent et change d'état au clic
        let followButton = app.buttons["Follow"]
        XCTAssertTrue(followButton.exists)
        followButton.tap()

        let unfollowButton = app.buttons["Unfollow"]
        XCTAssertTrue(unfollowButton.exists)
    }
}