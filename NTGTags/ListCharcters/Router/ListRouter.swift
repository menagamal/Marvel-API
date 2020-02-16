//
//  ListRouter.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit
import Hero

class ListRouter: BaseRouter{
    enum Destination {
        case  CharacterDetails(character:Results),None
    }
    var navigationController: UINavigationController?
    // MARK: - Initializer
    
    init() {
        
    }
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func navigate(to destination: ListRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func root(to destination: ListRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]
        UIApplication.shared.keyWindowInConnectedScenes?.rootViewController = navigationController
    }
    
    func present(to destination: ListRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.present(viewController, animated: true) {}
    }
    
    private func showDetails(character:Results) -> DetailsViewController{
        let vc:DetailsViewController = UIViewController.instanceXib()
        DetailsBuilder().build(navigator: navigationController!, vc: vc, character: character)
        return vc
    }
    
 
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .None:
            return UIViewController()
        case .CharacterDetails(let character):
            return showDetails(character: character)
        }
    }
    
}
