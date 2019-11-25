//
//  Utiliteis.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

// Utility File
struct Utilities {
    
    static func fetchLabel(_ font: UIFont, _ textStyle: UIFont.TextStyle) -> UILabel {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.preferredFont(forTextStyle: textStyle)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }
    
    static func createLabelWithText(_ font: UIFont, _ text: String) -> UILabel {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = font
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.text = text
        return lbl
    }
    
    static func setButtonWithImage(_ image: UIImage?) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(image, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }
}
