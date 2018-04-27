//
//  NewOperationPickerViewTableViewCell.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

protocol BaseNewPickerViewTableViewCellDelegate: class {
    
    func didSelectValueWithRow(_ row: Int)
}

class BaseNewPickerViewTableViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    var dataSource: [String] = [String]()
    weak var delegate: BaseNewPickerViewTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    // MARK: UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.didSelectValueWithRow(row)
    }
}
