//
//  NewOperationSelectableTableViewCell.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class BaseNewSelectableTableViewCell: UITableViewCell {

    @IBOutlet weak var selectableTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
