//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsTextField: CustomViewForTextField!
    @IBOutlet weak var inputLimitTextField: CustomViewForTextField!
    @IBOutlet weak var onlyCharactersTextField: CustomViewForTextField!
    @IBOutlet weak var countOfInputLimit: UILabel!
    
    let characterLimit = 11
    var inputLimitCharacterCountUpdater: CharacterCountUpdater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsTextField.textField.delegate = self
        inputLimitTextField.textField.delegate = self
        onlyCharactersTextField.textField.delegate = self
        
        inputLimitCharacterCountUpdater = CharacterCountUpdater(
            characterLimit: characterLimit,
            countLabel: countOfInputLimit,
            textField: inputLimitTextField.textField
        )
        updateCharacterCount()
    }
    
    func updateCharacterCount() {
        inputLimitCharacterCountUpdater?.update()
    }
    
}

extension TextFieldsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
// Logik for noDigitsTextField
        if textField == noDigitsTextField.textField {
            let characterSet = CharacterSet.decimalDigits
            
            for scalar in string.unicodeScalars {
                if characterSet.contains(scalar) {
                    return false
                }
            }
            
// Logik for inputLimitTextField
        } else if textField == inputLimitTextField.textField {
            guard let text = textField.text else {
                return true
            }
            
            let newLength = text.count + string.count - range.length
            return newLength <= characterLimit
            
// Logik for onlyCharactersTextField
        } else if textField == onlyCharactersTextField.textField {
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
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == inputLimitTextField.textField {
            updateCharacterCount()
        }
    }
}

//@IBOutlet weak var noDigitsTextField: UITextField!
//@IBOutlet weak var inputLimitTextField: UITextField!
//@IBOutlet weak var onlyCharactersTextField: UITextField!
//@IBOutlet weak var linkTextField: UITextField!
//@IBOutlet weak var validationRulesTextField: UITextField!

