//
//  MainTabBarViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add view controllers to main tab
        var mainViewControllers = [UIViewController]()
        mainViewControllers.append(StartModuleRouter.setupModule())
        mainViewControllers.append(SettingsRouter.setupModule())
        
        viewControllers = mainViewControllers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UITabBarControllerDelegate methods
    
    

}
