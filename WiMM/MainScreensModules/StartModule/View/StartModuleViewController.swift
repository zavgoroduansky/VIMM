//
//  StartModuleViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class StartModuleViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties
    @IBOutlet weak var walletsContainer: UIView!
    @IBOutlet weak var operationsContainer: UIView!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var presenter: StartModulePresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add child view controller view to container
        presenter?.createWalletViewController()
        presenter?.createOperationsViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        parent?.title = NSLocalizedString("OperationsTitle", comment: "")
    }
    
    //MARK: Actions
    
    @IBAction func positiveButtonAction(_ sender: UIButton) {
        showNewOperationView(operationType: .positive)
    }
    
    @IBAction func transferButtonAction(_ sender: UIButton) {
        showNewOperationView(operationType: .transfer)
    }
    
    @IBAction func borrowButtonAction(_ sender: UIButton) {
        showNewOperationView(operationType: .borrow)
    }
    
    @IBAction func negativeButtonAction(_ sender: UIButton) {
        showNewOperationView(operationType: .negative)
    }
    
    // MARK: private
    
    private func showNewOperationView(operationType: NewOperationType) {
        let operationModel = NewOperationModel(operationType: operationType, operationWallet: nil)
        presenter?.showNewOperationViewController(operationModel: operationModel)
    }
}

extension StartModuleViewController: StartModuleView {
    
    func updateViewWith(balance: String) {
        DispatchQueue.main.async {
            [unowned self] in
            self.balanceLabel.text = balance
        }
    }
    
    func walletViewControllerWasCreated(viewController: UIViewController) {
        add(viewController: viewController, to: walletsContainer)
    }
    
    func operationsViewCOntrollerWasCreated(ViewController: UIViewController) {
        add(viewController: ViewController, to: operationsContainer)
    }
}
