//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit
import SafariServices

class TextFieldsViewController: UIViewController, OpenLinkDelegate, ValidateRulseDelegate {
    
    @IBOutlet weak var noDigitsTextField: NoDigits!
    @IBOutlet weak var inputLimitTextField: CustomViewForTextField!
    @IBOutlet weak var onlyCharactersTextField: OnlyCharacters!
    @IBOutlet weak var linkTextField: Link!
    @IBOutlet weak var validatePasswordTextField: ValidationRules!
    @IBOutlet weak var countOfInputLimit: UILabel!
    @IBOutlet weak var validateIndikator: CustomIndicatorViewController!
    
    private  let characterLimit = 11
    private var inputLimitCharacterCountUpdater: CharacterCountUpdater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLimitTextField.textField.delegate = self
        linkTextField.delegate = self
        validatePasswordTextField.delegate = self
        addKeyboardHideOnTappedAroundRecognizer()
        
        inputLimitCharacterCountUpdater = CharacterCountUpdater(
            characterLimit: characterLimit,
            countLabel: countOfInputLimit,
            textField: inputLimitTextField.textField
        )
        updateCharacterCount()
        
    }
    
    private func updateCharacterCount() {
        inputLimitCharacterCountUpdater?.update()
    }
    
    func openLink(_ link: URL) {
        let safariViewController = SFSafariViewController(url: link)
        present(safariViewController, animated: true, completion: nil)
    }
    
    func chekValidationMinCharacters(_ validation: Bool) {
        validateIndikator.setMinCharacters(correct: validation)
    }
    func chekValidationContainsDigit(_ validation: Bool) {
        validateIndikator.setMinDigit(correct: validation)
    }
    func chekValidationLowercase(_ validation: Bool) {
        validateIndikator.setMinLowercase(correct: validation)
    }
    func chekValidationUpercase(_ validation: Bool) {
        validateIndikator.setMinCapital(correct: validation)
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

extension UIViewController {
    func addKeyboardHideOnTappedAroundRecognizer(cancelsTouchesInView: Bool = true) {
        let endEditingTapRecognizer = UITapGestureRecognizer(
            target: view,
            action: #selector(UIView.endEditing)
        )
        endEditingTapRecognizer.cancelsTouchesInView = cancelsTouchesInView
        view.addGestureRecognizer(endEditingTapRecognizer)
    }
}



