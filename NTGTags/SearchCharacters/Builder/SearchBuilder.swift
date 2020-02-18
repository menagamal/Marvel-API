//
//  SearchBuilder.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/17/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
import Foundation
import UIKit

class SearchBuilder {
    func build(navigator:UINavigationController,vc:SearchViewController) {
        let interactor = SearchInteractor()
        let router = SearchRouter(navigationController: navigator)
        vc.presenter = SearchPresenter(interactor: interactor, router: router, view: vc)
    }
}
