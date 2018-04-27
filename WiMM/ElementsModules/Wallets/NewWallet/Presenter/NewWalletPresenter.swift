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
}

extension NewWalletPresenter: NewWalletPresentation {
    
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
        view?.newWalletNameSelected(name)
    }
    
    func goNextFrom(viewController: UIViewController) {
        view?.goNextFrom(viewController: viewController)
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
}
