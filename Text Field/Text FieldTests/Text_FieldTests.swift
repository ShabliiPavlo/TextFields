//
//  Text_FieldTests.swift
//  Text FieldTests
//
//  Created by Pavel Shabliy on 22.06.2023.
//

import XCTest
@testable import Text_Field

final class Text_FieldTests: XCTestCase {
    
    var textField: UITextField!
    var countLabel: UILabel!
    
    var noDigitsView : NoDigitsView!
    var updater: CharacterCountUpdater!
    var onlyCharactersView : OnlyCharactersView!
    var linkView : LinkView!
    var validationRulesView : ValidationRulesView!
    var customIndicatorView : CustomIndicatorView!
    
    override func setUpWithError() throws {
        textField = UITextField()
        countLabel = UILabel()
        
        noDigitsView = NoDigitsView()
        updater = CharacterCountUpdater(characterLimit: 11, countLabel: countLabel, textField: textField)
        onlyCharactersView = OnlyCharactersView()
        linkView = LinkView()
        validationRulesView = ValidationRulesView()
        customIndicatorView = CustomIndicatorView()
    }
    
    override func tearDownWithError() throws {
        textField = nil
        countLabel = nil
        
        noDigitsView = nil
        onlyCharactersView = nil
        linkView = nil
        validationRulesView = nil
        customIndicatorView = nil
        try super.tearDownWithError()
    }
    
    func testNoDigitsView() throws {
        
        //Test case 1
        let shouldChange1 = noDigitsView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "a")
        XCTAssertTrue(shouldChange1)
        
        //Test case 2
        let shouldChange2 = noDigitsView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "1")
        XCTAssertFalse(shouldChange2)
    }
    
    func testUpdate() {
        
        //Test case 1
        textField.text = "Hello"
        updater.update()
        
        XCTAssertEqual(countLabel.text, "5/10")
        XCTAssertEqual(textField.layer.borderWidth, 0.0)
        XCTAssertEqual(textField.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(textField.textColor, UIColor.black)
    }
    
    func testOnlyCharactersView() throws {
        
        //Test case 1
        let shouldChange1 = onlyCharactersView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "a-1")
        XCTAssertTrue(shouldChange1)
        
        //Test case 2
        let shouldChange2 = onlyCharactersView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "1-a")
        XCTAssertFalse(shouldChange2)
        
        //Test case 3
        let shouldChange3 = onlyCharactersView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "a1")
        XCTAssertFalse(shouldChange3)
        
        //Test case 4
        let shouldChange4 = onlyCharactersView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: ":=+")
        XCTAssertFalse(shouldChange4)
    }
    
    func testLinkView() throws {
        
        //Test case 1
        let shouldChange = linkView.textField(textField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "a")
        XCTAssertTrue(shouldChange)
        
        //Test case 2
        guard let url = URL(string: "https:google.com") else { return }
        XCTAssertNoThrow(linkView.delegate?.openLink(url))
    }
    
    func testValidationRulesView() throws {
        
        //Test case 1
        let testPasswordCount = "12345678"
        let testCaseCount =  validationRulesView.chekCountOfCharacters(testPasswordCount)
        XCTAssertTrue(testCaseCount)
        
        //Test case 2
        let testCaseChekNumber = validationRulesView.chekNumber(testPasswordCount)
        XCTAssertTrue(testCaseChekNumber)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

