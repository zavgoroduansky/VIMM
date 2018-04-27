//
//  StartModulePresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class StartModulePresenter {

    // MARK: Properties

    weak var view: StartModuleView?
    var router: StartModuleWireframe?
    var interactor: StartModuleUseCase?
    
    private var selectedWallet: WalletModel?
    weak var operationTableInput: OperationTableInput?
}

extension StartModulePresenter: StartModulePresentation {
    
    func createWalletViewController() {
        view?.walletViewControllerWasCreated(viewController: WalletsCollectionRouter.setupModule(delegate: self))
    }
    
    func createOperationsViewController() {
        let operationTable = OperationsTableRouter.setupModule(delegate: self)
        operationTableInput = operationTable.input
        
        view?.operationsViewCOntrollerWasCreated(ViewController: operationTable.viewController)
    }
    
    func showNewOperationViewController(operationModel: NewOperationModel) {
        router?.navigateToNewOperationViewController(NewOperationRouter.setupModule(operationModel: operationModel))
    }
}

extension StartModulePresenter: StartModuleInteractorOutput {
    
    func onFetching(balance: String, for wallet: WalletModel) {
        view?.updateViewWith(balance: balance)
    }
}

extension StartModulePresenter : WalletCollectionDelegate {
    
    func didSelect(wallet: WalletModel) {
        selectedWallet = wallet
        interactor?.fetchBalanceFor(wallet: wallet)
        operationTableInput?.reloadDataWith(wallet: wallet)
    }
}

extension StartModulePresenter: OperationsTableDelegate {
    
    func didSelect(operationId: Int) {
        // do something with operation
    }
}
