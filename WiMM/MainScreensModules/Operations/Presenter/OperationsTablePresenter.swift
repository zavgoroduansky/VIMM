//
//  OperationsTablePresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

private let operationBlockSize = 20

class OperationsTablePresenter {

    // MARK: Properties

    weak var view: OperationsTableView?
    var router: OperationsTableWireframe?
    var interactor: OperationsTableUseCase?
    
    weak var delegate: OperationsTableDelegate?
    var wallet: WalletModel?
}

extension OperationsTablePresenter: OperationsTablePresentation {
    
    func fetchDataSource(startFrom: Int) {
        if let wallet = wallet {
            interactor?.fetchOperationsFromStorageFor(wallet: wallet, startFrom: startFrom, withSize: operationBlockSize, forceReload: false)
        }
    }
    
    func didSelect(operation: OperationsTableCellModel) {
        delegate?.didSelect(operationId: operation.operationId)
    }
}

extension OperationsTablePresenter: OperationsTableInteractorOutput {
    
    func onFetchOperationsSuccess(_ operations: [OperationsTableCellModel], forceReload: Bool) {
        view?.updateViewWithData(operations, forceReload: forceReload)
    }
}

extension OperationsTablePresenter: OperationTablePresenterInput {
    
    func reloadDataWith(wallet: WalletModel) {
        view?.startActivityIndicator()
        self.wallet = wallet
        interactor?.fetchOperationsFromStorageFor(wallet: wallet, startFrom: 0, withSize: operationBlockSize, forceReload: true)
    }
}
