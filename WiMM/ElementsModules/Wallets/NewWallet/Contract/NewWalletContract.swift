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
    func goNextFrom(viewController: UIViewController)
}

protocol NewWalletUseCase: class {
    
    func checkNewWalletName(_ name: String)
}

protocol NewWalletInteractorOutput: class {
    
    func onCheckNewWalletName(_ errorString: String?)
}

protocol NewWalletWireframe: class {
    
    func subViewControllers() -> [UIViewController]
}
