//
//  OperationsTableInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class OperationsTableInteractor {

    // MARK: Properties

    weak var output: OperationsTableInteractorOutput?
}

extension OperationsTableInteractor: OperationsTableUseCase {
    
    func fetchOperationsFromStorageFor(wallet: WalletModel, startFrom: Int, withSize: Int, forceReload: Bool) {
        DispatchQueue.global(qos: .default).async {
            [unowned self] in
            var dataSource = [OperationsTableCellModel]()
            dataSource.append(OperationsTableCellModel(operationId: 1, operationDate: Date(), operationType: .positive, operationDescription: "Salary", amount: "100"))
            dataSource.append(OperationsTableCellModel(operationId: 2, operationDate: Date(), operationType: .transfer, operationDescription: "Borrow to my friend", amount: "20"))
            dataSource.append(OperationsTableCellModel(operationId: 3, operationDate: Date(), operationType: .negative, operationDescription: "Buy new coat", amount: "60"))
            
            sleep(4)
            
            self.output?.onFetchOperationsSuccess(dataSource, forceReload: forceReload)
        }
        
    }
    
}
