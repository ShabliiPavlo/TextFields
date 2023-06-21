//
//  CustomTextField.swift
//  Text Field
//
//  Created by Pavel Shabliy on 01.06.2023.
//

import UIKit

class CustomViewForTextField: UIView {
    
    @IBOutlet var customView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomViewForTextField", owner: self, options: nil)
        customView.fixInView(self)
    }
}
