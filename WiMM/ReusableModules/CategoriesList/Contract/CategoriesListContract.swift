//
//  CategoriesListContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

protocol CategoriesListDelegate: class {
    
    func newCategoryWasAdd(_ category: CategoryModel)
    func newCategoryWasRemoved(_ category: CategoryModel)
    
}

protocol CategoriesListView: class {
    
    func updateViewWith(dataSource: [CategoryModel])
    func addNewCategory(category: CategoryModel)
    func showError(description: String)
}

protocol CategoriesListPresentation: class {
    
    func prepareDataSource()
    func addNewCategory(name: String)
    func deleteCategory(name: String)
}

protocol CategoriesListUseCase: class {
    
    func fetchCategories(wallet: WalletModel)
    func addNewCategory(name: String, wallet: inout WalletModel)
}

protocol CategoriesListInteractorOutput: class {
    
    func onFetchingCategories(categories: [CategoryModel])
    func newCategoryWasAddSuccesfully(category: CategoryModel)
    func cannotAddNewCategory(name: String, errorString: String)
}

protocol CategoriesListWireframe: class {
    // TODO: Declare wireframe methods
}
