//
//  CustomButton.swift
//  Consintration Game
//
//  Created by Mac on 4/1/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }

}
