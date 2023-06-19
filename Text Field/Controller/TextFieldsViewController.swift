//
//  ViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 31.05.2023.
//

import UIKit
import SafariServices

class TextFieldsViewController: UIViewController, OpenLinkDelegate {
    
    @IBOutlet weak var noDigitsTextField: NoDigits!
    @IBOutlet weak var inputLimitTextField: CustomViewForTextField!
    @IBOutlet weak var onlyCharactersTextField: OnlyCharacters!
    @IBOutlet weak var linkTextField: Link!
    @IBOutlet weak var validatePasswordTextField: ValidationRules!
    @IBOutlet weak var countOfInputLimit: UILabel!
    
    private  let characterLimit = 11
    private var inputLimitCharacterCountUpdater: CharacterCountUpdater?


    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsTextField.delegate = self
        inputLimitTextField.textField.delegate = self
        onlyCharactersTextField.delegate = self
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

//@IBOutlet weak var noDigitsTextField: UITextField!
//@IBOutlet weak var inputLimitTextField: UITextField!
//@IBOutlet weak var onlyCharactersTextField: UITextField!
//@IBOutlet weak var linkTextField: UITextField!
//@IBOutlet weak var validationRulesTextField: UITextField!


