//
//  NewOperationDescriptionTableViewCell.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/28/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class BaseNewDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionTextView: UITextView!
    weak var delegate: UITextViewDelegate? {
        didSet {
            descriptionTextView.delegate = delegate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
