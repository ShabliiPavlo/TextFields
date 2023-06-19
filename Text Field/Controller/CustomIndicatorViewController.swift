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
}
