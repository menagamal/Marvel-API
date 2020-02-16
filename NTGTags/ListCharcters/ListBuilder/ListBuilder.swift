//
//  ListBuilder.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class ListBuilder {
    func build(navigator:UINavigationController,vc:ListViewController) {
        let interactor = ListInteractor()
        let router = ListRouter(navigationController: navigator)
        vc.presenter = ListPresenter(interactor: interactor, router: router, view: vc)
    }
}
