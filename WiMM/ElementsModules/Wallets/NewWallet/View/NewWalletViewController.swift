//
//  NewWalletViewController.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

class NewWalletViewController: UIPageViewController, StoryboardLoadable {

    // MARK: Properties
    var subViewControllers = [UIViewController]()
    var pageControl = UIPageControl()
    lazy var newWallet = WalletModel(id: nil, name: "Default", currency: nil, categories: nil)

    var presenter: NewWalletPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self

        presenter?.subViewControllers()
        title = NSLocalizedString("NewWalletTitle", comment: "")
    }
    
    // MARK: Private
    
    private func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    private func showViewControllerWithIndex(_ index: Int) {
        setViewControllers([subViewControllers[index]], direction: .forward, animated: true, completion: nil)
        pageControl.currentPage = index
    }
}

extension NewWalletViewController: NewWalletView {
    
    func onSubViewControllers(_ array: [UIViewController]) {
        subViewControllers = array
        configurePageControl()
        
        if subViewControllers.count > 0 {
            showViewControllerWithIndex(0)
        } else {
            // need to close this controller
        }
    }
    
    func newWalletNameSelected(_ name: String) {
        newWallet.name = name
    }
    
    func newWalletCurrencySelected(_ currency: CurrencyModel) {
        
    }
    
    func newWalletCategoriesSelected(_ categories: [CategoryModel]) {
        
    }
    
    func goNextFrom(viewController: UIViewController) {
        let currentIndex = subViewControllers.index(of: viewController) ?? 0
        if currentIndex < subViewControllers.count-1 {
            showViewControllerWithIndex(currentIndex+1)
        }
    }
}

extension NewWalletViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = subViewControllers.index(of: viewController) ?? 0
        return currentIndex == subViewControllers.count-1 ? nil : subViewControllers[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = subViewControllers.index(of: viewController) ?? 0
        return currentIndex == 0 ? nil : subViewControllers[currentIndex-1]
    }
}

extension NewWalletViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
    }
}
