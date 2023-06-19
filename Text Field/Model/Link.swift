//
//  LinkTextField.swift
//  Text Field
//
//  Created by Pavel Shabliy on 15.06.2023.
//

import UIKit
import SafariServices

class Link: CustomViewForTextField, UITextFieldDelegate {
    
    private var linkTimer: Timer?
    var delegate: OpenLinkDelegate?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        linkTimer?.invalidate()
        linkTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] _ in
            if let text = textField.text, let url = URL(string: text), UIApplication.shared.canOpenURL(url) {
                self?.delegate?.openLink(url)
            }
        }
        return true
    }
    override func commonInit() {
        super.commonInit()
        textField.delegate = self
    }
}

protocol OpenLinkDelegate {
    func openLink(_ link: URL)
}
