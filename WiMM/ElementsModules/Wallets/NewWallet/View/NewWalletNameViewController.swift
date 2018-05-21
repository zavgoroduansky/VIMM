//
//  NewWalletNameViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class NewWalletNameViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: NewWalletPresentation?
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleViewElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private
    
    private func handleViewElements() {
        // text field
        nameTextField.font = Constants.Fonts.selectedText
        
        // description
        descriptionLabel.text = NSLocalizedString("NewWalletNameDescriptionText", comment: "")
        descriptionLabel.font = Constants.Fonts.infoText
        descriptionLabel.textColor = Constants.Colors.infoText
    }
}

extension NewWalletNameViewController: NewWalletNameDelegate {
    
    func nextButtonPressed() {
        if let walletName = nameTextField.text {
            if walletName.count == 0 {
                nameTextField.shake()
            } else {
                presenter?.checkNewWalletName(walletName)
            }
        } else {
            nameTextField.shake()
        }
    }
    
    func newWalletNameCheckedWith(errorString: String) {
        nameTextField.shake()
        // need to show error
        let alert = UIAlertController(title: nameTextField.text!, message: errorString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("CloseButtonTitle", comment: ""), style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func newWalletNameCheckSuccess() {
        // need to show next controller
        presenter?.saveNewWalletName(nameTextField.text!)
        presenter?.goNextFrom(index: index)
    }
    
    func controllerIndex() -> Int {
        return index
    }
}
