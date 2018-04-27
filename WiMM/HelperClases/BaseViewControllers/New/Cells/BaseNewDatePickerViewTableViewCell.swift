//
//  NewOperationDatePickerViewTableViewCell.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/28/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class BaseNewDatePickerViewTableViewCell: UITableViewCell {

    @IBOutlet weak var datePickerView: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
