//
//  CategoriesListPresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class CategoriesListPresenter {

    // MARK: Properties
    var wallet: WalletModel
    
    weak var view: CategoriesListView?
    var router: CategoriesListWireframe?
    var interactor: CategoriesListUseCase?
    var delegate: CategoriesListDelegate?
    
    init(wallet: WalletModel) {
        self.wallet = wallet
    }
}

extension CategoriesListPresenter: CategoriesListPresentation {
    
    func prepareDataSource() {
        interactor?.fetchCategories(wallet: wallet)
    }
    
    func addNewCategory(name: String) {
        interactor?.addNewCategory(name: name, wallet: &wallet)
    }
    
    func deleteCategory(name: String) {
        
    }
}

extension CategoriesListPresenter: CategoriesListInteractorOutput {
    
    func newCategoryWasAddSuccesfully(category: CategoryModel) {
        view?.addNewCategory(category: category)
        delegate?.newCategoryWasAdd(category)
    }
    
    func cannotAddNewCategory(name: String, errorString: String) {
        view?.showError(description: errorString)
    }
    
    func onFetchingCategories(categories: [CategoryModel]) {
        view?.updateViewWith(dataSource: categories)
    }
}
