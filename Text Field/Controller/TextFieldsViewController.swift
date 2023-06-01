//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsTextField: UITextField!
    @IBOutlet weak var inputLimitTextField: UITextField!
    @IBOutlet weak var onlyCharactersTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var validationRulesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension TextFieldsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       // Logik in noDigitsTextField
        if textField == noDigitsTextField {
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
