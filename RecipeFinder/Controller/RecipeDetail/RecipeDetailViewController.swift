//
//  RecipeDetailViewController.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

protocol RecipeDetailViewControllerDelegate {
  func backToMain()
}

class RecipeDetailViewController: UIViewController {
  
  var delegate: RecipeDetailViewControllerDelegate?
  
  @IBOutlet private weak var playerView: VideoPlayerView?
  @IBOutlet private weak var ingredientTextView: UITextView?
  @IBOutlet private weak var descriptionTextView: UITextView?
  @IBOutlet private weak var recipeTitleLabel: UILabel?
  
  private var viewModel: RecipeDetailViewModel?
  
  static func instantiate(viewModel: RecipeDetailViewModel) -> RecipeDetailViewController {
    let controller = UIStoryboard.instantiate(RecipeDetailViewController.self, id: "RecipeDetailViewController")
    controller.viewModel = viewModel
    return controller
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBarItems()
    setupUIComponents()
    loadData()
  }
  
  private func setupNavigationBarItems() {
    title = "Detail"
    let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                     style: .plain,
                                     target: self, action: #selector(backButtonDidTapped))

    self.navigationItem.leftBarButtonItem = backButton
    backButton.tintColor = .black
  }
  
  private func setupUIComponents() {
    ingredientTextView?.textContainerInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)
    descriptionTextView?.textContainerInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)
  }
  
  private func loadData() {
    recipeTitleLabel?.text = viewModel?.getRecipeName()
    playerView?.bind(urlString: viewModel?.getVideoUrl(), thumbnailUrl: viewModel?.getThumbnailUrl())
    ingredientTextView?.text = viewModel?.getIngredient()
    descriptionTextView?.text = viewModel?.getInstructions()
  }
  
  @objc private func backButtonDidTapped() {
    delegate?.backToMain()
  }
  
}
