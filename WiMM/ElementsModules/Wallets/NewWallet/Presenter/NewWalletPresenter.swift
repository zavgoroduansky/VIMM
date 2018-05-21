//
//  NewWalletPresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class NewWalletPresenter {

    // MARK: Properties

    weak var view: NewWalletView?
    var router: NewWalletWireframe?
    var interactor: NewWalletUseCase?
    
    weak var nameView: NewWalletNameDelegate?
    weak var currencyView: NewWalletCurrencyDelegate?
    weak var categoryView: NewWalletCategoriesDelegate?
    
    lazy var newWallet = WalletModel(id: nil, name: "Default", currency: nil, categories: nil)
}

extension NewWalletPresenter: NewWalletPresentation {
    
    func nextButtonPressedOnViewControllerWith(index: Int) {
        if nameView?.controllerIndex() == index {
            nameView?.nextButtonPressed()
        } else if currencyView?.controllerIndex() == index {
            currencyView?.nextButtonPressed()
        } else if categoryView?.controllerIndex() == index {
            categoryView?.nextButtonPressed()
        }
    }
    
    func subViewControllers() {
        if let array = router?.subViewControllers() {
            view?.onSubViewControllers(array)
        } else {
            view?.onSubViewControllers([UIViewController]())
        }
    }
    
    func checkNewWalletName(_ name: String) {
        interactor?.checkNewWalletName(name)
    }
    
    func saveNewWalletName(_ name: String) {
        newWallet.name = name
    }
    
    func saveNewWalletCurrency(_ currency: CurrencyModel) {
        newWallet.currency = currency
    }
    
    func goNextFrom(index: Int) {
        view?.goNextFrom(index: index)
    }
    
    func currencyList() {
        interactor?.currencyList()
    }
    
    func createCategoriesViewController() {
        categoryView?.categoriesViewControllerWasCreated(viewController: CategoriesListRouter.setupModule(wallet: newWallet, delegate: router as? CategoriesListDelegate))
    }
}

extension NewWalletPresenter: NewWalletInteractorOutput {
    
    func onCheckNewWalletName(_ errorString: String?) {
        if let errorText = errorString {
            nameView?.newWalletNameCheckedWith(errorString: errorText)
        } else {
            nameView?.newWalletNameCheckSuccess()
        }
    }
    
    func onCurrencyList(_ list: [CurrencyModel]) {
        currencyView?.onCurrencyList(list)
    }
}
