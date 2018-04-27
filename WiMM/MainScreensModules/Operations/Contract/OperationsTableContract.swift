//
//  OperationsTableContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

protocol OperationsTableView: class {
    
    func updateViewWithData(_ dataSource : [OperationsTableCellModel], forceReload: Bool)
    func startActivityIndicator()
}

protocol OperationsTablePresentation: class {
    
    func fetchDataSource(startFrom: Int)
    func didSelect(operation: OperationsTableCellModel)
}

protocol OperationsTableUseCase: class {
    
    func fetchOperationsFromStorageFor(wallet: WalletModel, startFrom: Int, withSize: Int, forceReload: Bool)
}

protocol OperationsTableInteractorOutput: class {
    
    func onFetchOperationsSuccess(_ operations: [OperationsTableCellModel], forceReload: Bool)
}

protocol OperationsTableWireframe: class {

}

protocol OperationsTableDelegate: class {
    
    func didSelect(operationId: Int)
}

protocol OperationTableInput: class {
    
    func reloadDataWith(wallet: WalletModel)
}

protocol OperationTablePresenterInput: class {
    
    func reloadDataWith(wallet: WalletModel)
}
