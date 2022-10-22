//
//  MainCoordinator.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

class MainCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let service = TastyAPIService()
    let controller = MainViewController.instantiate(viewModel: MainViewModel(service: service))
    controller.delegate = self
    navigationController.pushViewController(controller, animated: true)
  }
  
}

extension MainCoordinator: MainViewControllerDelegate {
  
  func seeDetail(recipe: Recipe) {
    let coordinator = RecipeDetailCoordinator(navigationController: navigationController, recipe: recipe)
    coordinator.parentCoordinator = self
    childCoordinators.append(coordinator)
    coordinator.start()
  }
  
}
