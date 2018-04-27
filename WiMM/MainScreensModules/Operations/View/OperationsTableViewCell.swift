//
//  OperationsTableViewCell.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class OperationsTableViewCell: UITableViewCell {

    @IBOutlet weak var operationImageView: UIImageView!
    @IBOutlet weak var operationDescriptionLabel: UILabel!
    @IBOutlet weak var operationAmountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
