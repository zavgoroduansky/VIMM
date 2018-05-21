//
//  BaseEntityListActionTableViewCell.swift
//  WiMM
//
//  Created by Завгородянський Олег on 5/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class BaseEntityListActionTableViewCell: UITableViewCell {

    // MARK: Properties
    var actionImage: UIImage? {
        didSet {
            actionButton.setImage(actionImage, for: .normal)
        }
    }
    var actionTitle: String? {
        didSet {
            actionButton.setTitle(actionTitle, for: .normal)
        }
    }
    
    @IBOutlet weak private var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
