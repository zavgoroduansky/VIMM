//
//  NewWalletCurrencyViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class NewWalletCurrencyViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var currencyButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: NewWalletPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: actions
    
    @objc func rightNavigationBarButtonAction(_ sender: UIBarButtonItem) {

        currencyButton.shake()
    }
    
    @IBAction func currencyButtonAction(_ sender: UIButton) {
        
        
    }
    
    // MARK: Private
    
    private func handleViewElements() {
        // navigation
        parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.Navigation.rightButtonTitle, style: .plain, target: self, action: #selector(rightNavigationBarButtonAction))
        
        // description
        descriptionLabel.text = NSLocalizedString("NewWalletCurrencyDescriptionText", comment: "")
        descriptionLabel.font = Constants.Fonts.infoText
        descriptionLabel.textColor = Constants.Colors.infoText
    }
    
}

extension NewWalletCurrencyViewController: NewWalletCurrencyDelegate {
    
}
