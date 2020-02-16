//
//  DetailsBuilder.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
import UIKit

class DetailsBuilder {
    func build(navigator:UINavigationController,vc:DetailsViewController,character:Results) {
        let interactor = DetailsInteractor()
        let router = DetailsRouter(navigationController: navigator)
        vc.presenter = DetailsPresenter(interactor: interactor, router: router, view: vc, character: character)
    }
}
