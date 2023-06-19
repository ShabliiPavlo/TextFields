//
//  OnlyCharactersTextFieldDelegate.swift
//  Text Field
//
//  Created by Pavel Shabliy on 08.06.2023.
//

import UIKit

class OnlyCharacters: CustomViewForTextField, UITextFieldDelegate {
    
    private  let placeholderForOnlyCharactersTextField = "text-numbers"
    var delegate: UITextFieldDelegate?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let replacedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if replacedText.count == 1 {
            return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: replacedText))
        } else {
            let components = replacedText.components(separatedBy: "-")
            if components.count == 1 {
                let allowedCharacters = CharacterSet.letters.union(CharacterSet(charactersIn: "-"))
                let characterSet = CharacterSet(charactersIn: replacedText)
                let isOnlyLettersOrDash = allowedCharacters.isSuperset(of: characterSet)
                return isOnlyLettersOrDash
            } else if components.count == 2 {
                let digitsCharacterSet = CharacterSet.decimalDigits
                let digitsString = components[1]
                let isOnlyDigitsAfterDash = digitsCharacterSet.isSuperset(of: CharacterSet(charactersIn: digitsString))
                return isOnlyDigitsAfterDash
            } else {
                return !replacedText.contains("-")
            }
        }
    }
    
    override func commonInit() {
        super.commonInit()
        textField.delegate = self
        textField.placeholder = placeholderForOnlyCharactersTextField
    }
}
