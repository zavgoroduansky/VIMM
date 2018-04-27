//
//  NewWalletContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

protocol NewWalletNameDelegate: class {
    
    func newWalletNameCheckedWith(errorString: String)
    func newWalletNameCheckSuccess()
}

protocol NewWalletCurrencyDelegate: class {
    
    func onCurrencyList(_ list: [CurrencyModel])
}

protocol NewWalletCategoriesDelegate: class {
    
}

protocol NewWalletView: class {
    
    func onSubViewControllers(_ array: [UIViewController])
    func newWalletNameSelected(_ name: String)
    func newWalletCurrencySelected(_ currency: CurrencyModel)
    func newWalletCategoriesSelected(_ categories: [CategoryModel])
    func goNextFrom(viewController: UIViewController)
}

protocol NewWalletPresentation: class {
    
    func subViewControllers()
    func checkNewWalletName(_ name: String)
    func saveNewWalletName(_ name: String)
    func saveNewWalletCurrency(_ currency: CurrencyModel)
    func goNextFrom(viewController: UIViewController)
    func currencyList()
}

protocol NewWalletUseCase: class {
    
    func checkNewWalletName(_ name: String)
    func currencyList()
}

protocol NewWalletInteractorOutput: class {
    
    func onCheckNewWalletName(_ errorString: String?)
    func onCurrencyList(_ list: [CurrencyModel])
}

protocol NewWalletWireframe: class {
    
    func subViewControllers() -> [UIViewController]
}
