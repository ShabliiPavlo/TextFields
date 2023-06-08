//
//  NoDigitsTextFieldView.swift
//  Text Field
//
//  Created by Pavel Shabliy on 06.06.2023.
//

import UIKit

class NoDigitsTextFieldDelegate: CustomViewForTextField, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characterSet = CharacterSet.decimalDigits
        
        for scalar in string.unicodeScalars {
            if characterSet.contains(scalar) {
                return false
            }
        }
        
        return true
    }
}


