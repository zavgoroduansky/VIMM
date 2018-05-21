//
//  CategoriesListInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/27/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class CategoriesListInteractor {

    // MARK: Properties

    weak var output: CategoriesListInteractorOutput?
}

extension CategoriesListInteractor: CategoriesListUseCase {
    
    func fetchCategories(wallet: WalletModel) {
        output?.onFetchingCategories(categories: CategoryService.fetchCategoryFor(wallet: wallet))
    }
    
    func addNewCategory(name: String, wallet: inout WalletModel) {
        if let newCategory = CategoryService.addNewCategory(name: name, wallet: &wallet) {
            output?.newCategoryWasAddSuccesfully(category: newCategory)
        } else {
            output?.cannotAddNewCategory(name: name, errorString: "Name is not unic")
        }
    }
}
