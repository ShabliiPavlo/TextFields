//
//  CustomIndicatorViewController.swift
//  Text Field
//
//  Created by Pavel Shabliy on 16.06.2023.
//

import UIKit

class CustomIndicatorViewController: UIView {
    
    @IBOutlet var indicatorCustomView: UIView!
    
    @IBOutlet weak var minCharacters: UILabel!
    @IBOutlet weak var minDigit: UILabel!
    @IBOutlet weak var minLowercase: UILabel!
    @IBOutlet weak var minCapital: UILabel!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInitIndikator()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInitIndikator()
        }
    
    func commonInitIndikator() {
            Bundle.main.loadNibNamed("CustomIndicatorViewController", owner: self, options: nil)
        indicatorCustomView.fixInView(self)
        }
    
    func setMinCharacters(correct: Bool) {
        minCharacters.textColor = correct ? .green : .black
        minCharacters.text = correct ? "✅Min late 8 characters" : "-Min late 8 characters"
        }
    
        func setMinDigit(correct: Bool) {
            minDigit.textColor = correct ? .green : .black
            minDigit.text = correct ? "✅Min 1 digit" : "-Min 1 digit"
        }
        
        func setMinLowercase(correct: Bool) {
            minLowercase.textColor = correct ? .green : .black
            minLowercase.text = correct ? "✅Min 1 lowercase" : "-Min 1 lowercase"
        }
        
        func setMinCapital(correct: Bool) {
            minCapital.textColor = correct ? .green : .black
            minCapital.text = correct ? "✅Min 1 capital require" : "-Min 1 capital require"
        }
}
