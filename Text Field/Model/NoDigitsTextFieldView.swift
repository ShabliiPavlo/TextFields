//
//  NoDigitsTextFieldView.swift
//  Text Field
//
//  Created by Pavel Shabliy on 06.06.2023.
//

import UIKit

class NoDigitsTextField: CustomViewForTextField {
    // Var 1
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        let characterSet = CharacterSet.decimalDigits
    //
    //        for scalar in string.unicodeScalars {
    //            if characterSet.contains(scalar) {
    //                return false
    //            }
    //        }
    //        return true
    //    }
    
    // Var 2
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        let decimalCharacterSet = CharacterSet.decimalDigits
    //        return string.rangeOfCharacter(from: decimalCharacterSet) == nil
    //    }
    
    // Var 3
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        for char in string {
    //            if char.isNumber {
    //                return false
    //            }
    //        }
    //        return true
    //    }
    
    // Var 4
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.filter { $0.isNumber }.isEmpty
    }
    
    override func commonInit() {
        super.commonInit()
        textField.delegate = self
    }
}


