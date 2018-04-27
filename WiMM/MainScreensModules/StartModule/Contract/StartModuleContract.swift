//
//  StartModuleContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

protocol StartModuleView: class {
    
    func updateViewWith(balance: String)
    func walletViewControllerWasCreated(viewController: UIViewController)
    func operationsViewCOntrollerWasCreated(ViewController: UIViewController)
}

protocol StartModulePresentation: class {
    
    func createWalletViewController()
    func createOperationsViewController()
    func showNewOperationViewController(operationModel: NewOperationModel)
}

protocol StartModuleUseCase: class {
    
    func fetchBalanceFor(wallet: WalletModel)
}

protocol StartModuleInteractorOutput: class {
    
    func onFetching(balance: String, for wallet: WalletModel)
}

protocol StartModuleWireframe: class {
    
    func navigateToNewOperationViewController(_ viewController: UIViewController)
}
