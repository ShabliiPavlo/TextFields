//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsTextField: CustomTextField!
    @IBOutlet weak var countOfInputLimit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsTextField.textFields.delegate = self
    }
}

extension TextFieldsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
// Logik for noDigitsTextField
        if textField == noDigitsTextField.textFields {
            let characterSet = CharacterSet.decimalDigits
            
            for scalar in string.unicodeScalars {
                if characterSet.contains(scalar) {
                    return false
                }
            }
        }
        return true
    }
}

//@IBOutlet weak var noDigitsTextField: UITextField!
//@IBOutlet weak var inputLimitTextField: UITextField!
//@IBOutlet weak var onlyCharactersTextField: UITextField!
//@IBOutlet weak var linkTextField: UITextField!
//@IBOutlet weak var validationRulesTextField: UITextField!
