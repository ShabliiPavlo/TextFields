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
    
    let characterLimit = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsTextField.allTextFields.delegate = self
        inputLimitTextField.allTextFields.delegate = self
        updateCharacterCount()
    }
    
    func updateCharacterCount() {
        let count = inputLimitTextField.allTextFields.text?.count ?? 0
        let remainingCount = characterLimit - count
        
        countOfInputLimit.text = String(remainingCount) + "/10"
        
        inputLimitTextField.allTextFields.layer.borderWidth = remainingCount <= 0 ? 1.0 : 0.0
        inputLimitTextField.allTextFields.layer.borderColor = remainingCount <= 0 ? UIColor.red.cgColor : UIColor.black.cgColor
    }
    
}

extension TextFieldsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
// Logik for noDigitsTextField
        if textField == noDigitsTextField.allTextFields {
            let characterSet = CharacterSet.decimalDigits
            
            for scalar in string.unicodeScalars {
                if characterSet.contains(scalar) {
                    return false
                }
            }
// Logik for inputLimitTextField
        } else if textField == inputLimitTextField.allTextFields {
            guard let text = textField.text else {
                return true
            }
            
            let newLength = text.count + string.count - range.length
            return newLength <= characterLimit
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == inputLimitTextField.allTextFields {
            updateCharacterCount()
        }
    }
}

//@IBOutlet weak var noDigitsTextField: UITextField!
//@IBOutlet weak var inputLimitTextField: UITextField!
//@IBOutlet weak var onlyCharactersTextField: UITextField!
//@IBOutlet weak var linkTextField: UITextField!
//@IBOutlet weak var validationRulesTextField: UITextField!
