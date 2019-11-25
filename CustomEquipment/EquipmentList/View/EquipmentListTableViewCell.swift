//
//  EquipmentListTableViewCell.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import UIKit

protocol EquipmentCellDelegate: class {
    func numberOfProductsSelected(cell: EquipmentListTableViewCell, row: Int, section: Int)
}

class EquipmentListTableViewCell : UITableViewCell {
    weak var delegate: EquipmentCellDelegate?
    let minValue = 0
    var rowNumber: Int!
    var sectionNumber: Int!
    var checkUncheckStatus: Bool!
    // Equipment
    var equipment: EachEquipment? {
        didSet {
            // Header list
            equipmentIdLabel.text = String(equipment!.id)
            equipmentMakeLabel.text = equipment?.make
        }
    }
    
    private let equipmentIdLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline), .subheadline)
    }()
    
    private let equipmentMakeLabel: UILabel = {
        return Utilities.fetchLabel(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline), .headline)
    }()
    
    private let equipmentSelectButton: UIButton = {
        return Utilities.setButtonWithImage(UIImage(systemName: "checkmark.square"))
    }()
    
    private let equipmentDetailButton: UIButton = {
        return Utilities.setButtonWithImage(UIImage(systemName: "checkmark.right"))
    }()
    
    @objc func equipmentSelectionTapped() {
        if checkUncheckStatus {
            checkUncheckStatus = false
            equipmentSelectButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkUncheckStatus = true
            equipmentSelectButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        print("Selected")
    }
    
    @objc func equipmentDetailTapped() {
        delegate?.numberOfProductsSelected(cell: self, row: rowNumber, section: sectionNumber)
        print("Detail")
    }
        
    func setExpanded() {
        equipmentDetailButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }

    func setCollapsed() {
        equipmentDetailButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        headerTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EquipmentListTableViewCell {
    func headerTextView() {
        addSubview(equipmentSelectButton)
        addSubview(equipmentIdLabel)
        addSubview(equipmentMakeLabel)
        addSubview(equipmentDetailButton)
        // Element.1
        equipmentSelectButton.anchor(top: topAnchor, left: safeLeftAnchor, bottom: nil, right: leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 30, height: 30, enableInsets: false)
        // Element.2
        equipmentIdLabel.anchor(top: topAnchor, left: equipmentSelectButton.rightAnchor, bottom: nil, right: equipmentMakeLabel.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/8, height: 30, enableInsets: false)
        // Element.3
        equipmentMakeLabel.anchor(top: topAnchor, left: equipmentIdLabel.rightAnchor, bottom: nil, right: equipmentDetailButton.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.4
        equipmentDetailButton.anchor(top: topAnchor, left: equipmentMakeLabel.rightAnchor, bottom: nil, right: safeRightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 30, height: 30, enableInsets: false)
        
        equipmentSelectButton.addTarget(self, action: #selector(equipmentSelectionTapped), for: .touchUpInside)
        equipmentDetailButton.addTarget(self, action: #selector(equipmentDetailTapped), for: .touchUpInside)
    }
}


