//
//  ValidationRules.swift
//  Text Field
//
//  Created by Pavel Shabliy on 16.06.2023.
//

import UIKit

protocol ValidateRulseDelegate {
    func chekValidationMinCharacters(_ validation:Bool)
    func chekValidationContainsDigit(_ validation:Bool)
    func chekValidationLowercase(_ validation:Bool)
    func chekValidationUpercase(_ validation:Bool)
}

class ValidationRulesView: CustomViewForTextField, UITextFieldDelegate {
    
    private let digitPredicate = NSPredicate(format: "SELF MATCHES %@", ".*[0-9].*")
    private let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", ".*[a-z].*")
    private let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z].*")
    
    var delegate: ValidateRulseDelegate?
    
    private func validatePassword(_ password: String) {
        
        func chekCountOfCharacters() -> Bool {
            if password.count < 8 {
                return false
            }
            return true
        }
        
        func chekNumber() -> Bool {
            if !digitPredicate.evaluate(with: password) {
                return false
            }
            return true
        }
        
        func chekLowercase() -> Bool {
            if !lowercasePredicate.evaluate(with: password) {
                return false
            }
            return true
        }
        
        func chekUpercase() -> Bool {
            if !uppercasePredicate.evaluate(with: password) {
                return false
            }
            return true
        }
        
        delegate?.chekValidationMinCharacters(chekCountOfCharacters())
        delegate?.chekValidationContainsDigit(chekNumber())
        delegate?.chekValidationLowercase(chekLowercase())
        delegate?.chekValidationUpercase(chekUpercase())
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let password = textField.text {
            validatePassword(password)
        }
    }
    
    override func commonInit() {
        super.commonInit()
        textField.delegate = self
        textField.isSecureTextEntry = true
    }
}

