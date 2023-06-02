//
//  CharacterCountUpdater.swift
//  Text Field
//
//  Created by Pavel Shabliy on 02.06.2023.
//

import UIKit

class CharacterCountUpdater {
    private let characterLimit: Int
    private let countLabel: UILabel
    private let textField: UITextField
    
    init(characterLimit: Int, countLabel: UILabel, textField: UITextField) {
        self.characterLimit = characterLimit
        self.countLabel = countLabel
        self.textField = textField
    }
    
    func update() {
        let count = textField.text?.count ?? 0
        let remainingCount = characterLimit - count
        
        countLabel.text = "\(remainingCount)/\(characterLimit)"
        
        textField.layer.borderWidth = remainingCount <= 0 ? 1.0 : 0.0
        textField.layer.borderColor = remainingCount <= 0 ? UIColor.red.cgColor : UIColor.black.cgColor
    }
}
