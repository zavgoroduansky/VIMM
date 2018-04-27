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
    
    var selectedCurrency: CurrencyModel? = nil {
        didSet {
            handleCurrencySelection(currency: selectedCurrency)
        }
    }
    var presenter: NewWalletPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleViewElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: actions
    
    @objc func rightNavigationBarButtonAction(_ sender: UIBarButtonItem) {
        if let currency = selectedCurrency {
            // need to show next controller
            presenter?.saveNewWalletCurrency(currency)
            presenter?.goNextFrom(viewController: self)
        } else {
            currencyButton.shake()
        }
    }
    
    @IBAction func currencyButtonAction(_ sender: UIButton) {
        presenter?.currencyList()
    }
    
    // MARK: Private
    
    private func handleViewElements() {
        // navigation
        parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.Navigation.rightButtonTitle, style: .plain, target: self, action: #selector(rightNavigationBarButtonAction))
        
        // currency
        handleCurrencySelection(currency: selectedCurrency)
        
        // description
        descriptionLabel.text = NSLocalizedString("NewWalletCurrencyDescriptionText", comment: "")
        descriptionLabel.font = Constants.Fonts.infoText
        descriptionLabel.textColor = Constants.Colors.infoText
    }
    
    private func handleCurrencySelection(currency: CurrencyModel?) {
        var title = NSLocalizedString("NewWalletCurrencyButtonText", comment: "")
        var titleColor = Constants.Colors.infoText
        var titleFont = Constants.Fonts.infoText
        if let selectedCurrency = currency {
            title = "\(selectedCurrency.name) (\(selectedCurrency.shortName))"
            titleColor = UIColor.black
            titleFont = Constants.Fonts.selectedText
        }
        currencyButton.setTitle(title, for: .normal)
        currencyButton.setTitleColor(titleColor, for: .normal)
        currencyButton.titleLabel?.font = titleFont
    }
}

extension NewWalletCurrencyViewController: NewWalletCurrencyDelegate {
    
    func onCurrencyList(_ list: [CurrencyModel]) {
        let alert = UIAlertController(title: NSLocalizedString("NewWalletCurrencySelectTitle", comment: ""), message: NSLocalizedString("NewWalletCurrencySelectDescription", comment: ""), preferredStyle: .actionSheet)
        for currency in list {
            alert.addAction(UIAlertAction(title: "\(currency.name) (\(currency.shortName))", style: .default, handler: {[weak self] (action) in
                self?.selectedCurrency = currency
            }))
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("CloseButtonTitle", comment: ""), style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
