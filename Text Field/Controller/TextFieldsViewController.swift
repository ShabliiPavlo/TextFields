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
    @IBOutlet weak var countOfInputLimit: UILabel!
    
    let characterLimit = 11
    var inputLimitCharacterCountUpdater: CharacterCountUpdater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsTextField.textField.delegate = self
        inputLimitTextField.textField.delegate = self
        
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
