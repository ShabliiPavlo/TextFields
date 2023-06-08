//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsTextField: NoDigitsTextFieldDelegate!
    @IBOutlet weak var inputLimitTextField: CustomViewForTextField!
    @IBOutlet weak var onlyCharactersTextField: OnlyCharactersTextFieldDelegate!
    @IBOutlet weak var countOfInputLimit: UILabel!
    
  private  let placeholderForOnlyCharactersTextField = "text-numbers"
  private  let characterLimit = 11
    var inputLimitCharacterCountUpdater: CharacterCountUpdater?
    
    private let noDigitsTextFieldDelegate = NoDigitsTextFieldDelegate()
    private let onlyCharactersTextFieldDelegate = OnlyCharactersTextFieldDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        onlyCharactersTextField.textField.placeholder = placeholderForOnlyCharactersTextField
        
        noDigitsTextField.textField.delegate = noDigitsTextFieldDelegate
        inputLimitTextField.textField.delegate = self
        onlyCharactersTextField.textField.delegate = onlyCharactersTextFieldDelegate
        
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

