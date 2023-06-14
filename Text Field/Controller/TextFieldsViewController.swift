//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsTextField: NoDigitsTextField!
    @IBOutlet weak var inputLimitTextField: CustomViewForTextField!
    @IBOutlet weak var onlyCharactersTextField: OnlyCharactersTextField!
    @IBOutlet weak var countOfInputLimit: UILabel!
    
    
    private  let characterLimit = 11
    private var inputLimitCharacterCountUpdater: CharacterCountUpdater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsTextField.commonInit()
        inputLimitTextField.textField.delegate = self
        onlyCharactersTextField.commonInit()
        
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
        
        //// Logik for inputLimitTextField
        if textField == inputLimitTextField.textField {
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

