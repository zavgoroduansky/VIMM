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
    
    func nextButtonPressed()
    func newWalletNameCheckedWith(errorString: String)
    func newWalletNameCheckSuccess()
    func controllerIndex() -> Int
}

protocol NewWalletCurrencyDelegate: class {
    
    func nextButtonPressed()
    func onCurrencyList(_ list: [CurrencyModel])
    func controllerIndex() -> Int
}

protocol NewWalletCategoriesDelegate: class {
    
    func nextButtonPressed()
    func categoriesViewControllerWasCreated(viewController: UIViewController)
    func controllerIndex() -> Int
}

protocol NewWalletView: class {
    
    func onSubViewControllers(_ array: [UIViewController])
    func goNextFrom(index: Int)
}

protocol NewWalletPresentation: class {
    
    func nextButtonPressedOnViewControllerWith(index: Int)
    func subViewControllers()
    func checkNewWalletName(_ name: String)
    func saveNewWalletName(_ name: String)
    func saveNewWalletCurrency(_ currency: CurrencyModel)
    func goNextFrom(index: Int)
    func currencyList()
    func createCategoriesViewController()
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
