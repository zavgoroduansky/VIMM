//
//  OperationsModuleContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

protocol OperationsModuleView: class {
    
    func walletViewControllerWasCreated(viewController: UIViewController)
}

protocol OperationsModulePresentation: class {
    
    func createWalletViewController()
}

protocol OperationsModuleUseCase: class {
    // TODO: Declare use case methods
}

protocol OperationsModuleInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol OperationsModuleWireframe: class {
    // TODO: Declare wireframe methods
}
