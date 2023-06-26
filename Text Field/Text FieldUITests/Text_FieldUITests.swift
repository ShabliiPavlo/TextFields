//
//  Text_FieldUITests.swift
//  Text FieldUITests
//
//  Created by Pavel Shabliy on 26.06.2023.
//

import XCTest

final class Text_FieldUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        //        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testNoDigits() throws {
        
        let textField = app.otherElements["noDigitsText"].children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        
        textField.typeText("abc123")
        
        XCTAssertEqual(textField.value as! String, "abc")
    }
    
    func testInputLimit() throws {
                
        let textField = app.otherElements["inputLimitText"].children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        
        textField.typeText("1234567890000")
        
        XCTAssertEqual(textField.value as! String, "12345678900")
    }
    
    func testOnlyCharacterst() throws {
        
        let textField = app.otherElements["onlyCharactersText"].children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        
        textField.typeText("-123solo456-SOLO789")
        
        XCTAssertEqual(textField.value as! String, "solo-789")
    }
    
    func testLink() throws {
        
        let textField = app.otherElements["linkText"].children(matching: .other).element.children(matching: .textField).element
        textField.tap()

        textField.typeText("https:google.com")
        
        sleep(3)
        
        XCTAssertFalse(textField.isHittable)
    }
    
    func testValidatePassword() throws {
        
        let minCharactersLable = app.staticTexts["minCharacters"]
        let test = "✅Min late 8 characters"
        let textField = app.otherElements["validatePasswordText"].children(matching: .other).element.children(matching: .secureTextField).element
        textField.tap()
        
        textField.typeText("1234567890")
        
        XCTAssertEqual(minCharactersLable.label, test )
    }
}
