//
//  RecipeDetailCoordinator.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

class RecipeDetailCoordinator: Coordinator {

  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  var parentCoordinator: Coordinator?
  var recipe: Recipe!
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  convenience init(navigationController: UINavigationController, recipe: Recipe) {
    self.init(navigationController: navigationController)
    self.recipe = recipe
  }
  
  func start() {
    let controller = RecipeDetailViewController.instantiate(viewModel: RecipeDetailViewModel(recipe))
    controller.delegate = self
    navigationController.pushViewController(controller, animated: true)
  }
 
}

extension RecipeDetailCoordinator: RecipeDetailViewControllerDelegate {
  func backToMain() {
    parentCoordinator?.navigationController.popViewController(animated: true)
    parentCoordinator?.childCoordinators.removeLast()
  }
}

