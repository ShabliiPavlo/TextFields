//
//  ValidationRules.swift
//  Text Field
//
//  Created by Pavel Shabliy on 16.06.2023.
//

import UIKit

class ValidationRules: CustomViewForTextField, UITextFieldDelegate {
    
    var delegate: UITextFieldDelegate?
    
    func isPasswordValid(_ password: String) -> Bool {
        // Chek count passwor
        if password.count < 8 {
            return false
        }
        
        // Chek number in password
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@", ".*[0-9].*")
        if !digitPredicate.evaluate(with: password) {
            return false
        }
        
        // Chek lowercase in pasword
        let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", ".*[a-z].*")
        if !lowercasePredicate.evaluate(with: password) {
            return false
        }
        
        // Chek uppercase in password
        let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z].*")
        if !uppercasePredicate.evaluate(with: password) {
            return false
        }
        
        return true
    }
    
    func validatePassword(_ password: String) {
        if isPasswordValid(password) {
                // Password is valid
            print("Yes")
            } else {
                // Password is invalid
                print("No")
            }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let password = textField.text {
               validatePassword(password)
           }
    }
    
    override func commonInit() {
        super.commonInit()
        textField.delegate = self
    }
}


