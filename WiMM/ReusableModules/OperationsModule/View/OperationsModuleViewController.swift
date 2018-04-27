//
//  OperationsModuleViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class OperationsModuleViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties

    @IBOutlet weak var walletsContainer: UIView!
    @IBOutlet weak var analyticContainer: UIView!
    
    var presenter: OperationsModulePresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add child view controller view to container
        presenter?.createWalletViewController()
        // need to add analytic container also
    }
    
}

extension OperationsModuleViewController: OperationsModuleView {
    
    func walletViewControllerWasCreated(viewController: UIViewController) {
        add(viewController: viewController, to: walletsContainer)
    }
}
