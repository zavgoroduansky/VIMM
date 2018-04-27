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
    
    // MARK: actions
    
    @objc func rightNavigationBarButtonAction(_ sender: UIBarButtonItem) {
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

    // MARK: Private
    
    private func handleViewElements() {
        // navigation
        parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.Navigation.rightButtonTitle, style: .plain, target: self, action: #selector(rightNavigationBarButtonAction))
        
        // description
        descriptionLabel.text = NSLocalizedString("NewWalletNameDescriptionText", comment: "")
        descriptionLabel.font = Constants.Fonts.infoText
        descriptionLabel.textColor = Constants.Colors.infoText
    }
}

extension NewWalletNameViewController: NewWalletNameDelegate {
    
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
        presenter?.goNextFrom(viewController: self)
    }
}
