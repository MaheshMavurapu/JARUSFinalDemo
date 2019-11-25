//
//  EquipmentTableViewCell.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import UIKit

// Generic Equipment Table Cell.
class EquipmentTableViewCell : UITableViewCell {
    
    var equipment: EachEquipment? {
        didSet {
            // All Subtitle list
            vinLabel.text = "VIN         " + equipment!.vin
            yearLabel.text = "Year       " + String(equipment!.year)
            makeLabel.text = "Make     " + equipment!.make
            valueLabel.text = "Value    " + " $\(String(equipment!.value))"
            lengthLabel.text = "Length  " + "\(String(equipment!.length)) ft"
        }
    }
    
    // List#1
    private let vinLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline), .headline)
    }()
    
    // List#2
    private let yearLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline), .headline)
    }()
    
    // List#3
    private let makeLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline), .headline)
    }()
    
    // List#4
    private let valueLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline), .headline)
    }()
    
    // List#5
    private let lengthLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline), .headline)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subTitleTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EquipmentTableViewCell {
    
    func subTitleTextView() {
        addSubview(vinLabel)
        addSubview(yearLabel)
        addSubview(makeLabel)
        addSubview(valueLabel)
        addSubview(lengthLabel)
        // Element.1
        vinLabel.anchor(top: topAnchor, left: safeLeftAnchor, bottom: yearLabel.topAnchor, right: safeRightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.2
        yearLabel.anchor(top: vinLabel.bottomAnchor, left: safeLeftAnchor, bottom: makeLabel.topAnchor, right: safeRightAnchor, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.3
        makeLabel.anchor(top: yearLabel.bottomAnchor, left: safeLeftAnchor, bottom: valueLabel.topAnchor, right: safeRightAnchor, paddingTop: 90, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.4
        valueLabel.anchor(top: makeLabel.bottomAnchor, left: safeLeftAnchor, bottom: lengthLabel.topAnchor, right: safeRightAnchor, paddingTop: 140, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.5
        lengthLabel.anchor(top: valueLabel.bottomAnchor, left: safeLeftAnchor, bottom: nil, right: safeRightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
    }
}

