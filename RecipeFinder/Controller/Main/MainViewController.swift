//
//  MainViewController.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

protocol MainViewControllerDelegate {
  func seeDetail(recipe: Recipe)
}

class MainViewController: UIViewController {
  
  var delegate: MainViewControllerDelegate?
  
  @IBOutlet private weak var collectionView: UICollectionView?
  
  private var viewModel: MainViewModel!
  private var isFetchingResult = false
  
  static func instantiate(viewModel: MainViewModel) -> MainViewController {
    let viewController = UIStoryboard.instantiate(MainViewController.self, id: "MainViewController")
    viewController.viewModel = viewModel
    return viewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Recipe Finder"
    setupCollectionView()
    getRecipes()
  }
  
  func setupCollectionView() {
    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.registerCellClass(RecipeCollectionViewCell.self)
    collectionView?.registerCellClass(LoadingCollectionViewCell.self)
    collectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: UIScreen.safeAreaBottom, right: 10)
  }
  
  func getRecipes() {
    let onSuccess: Action = { [weak self] in
      self?.collectionView?.reloadData()
    }
    
    let onError = { [weak self] (error: String) in
      showAlert(in: self, message: error)
    }
    
    viewModel.getRecipes(next: 50, onSuccess: onSuccess, onError: onError)
  }
  
}

extension MainViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.dataSource.count + 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if viewModel.dataSource.count == indexPath.item {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCollectionViewCell.identifier, for: indexPath) as! LoadingCollectionViewCell
      
      if viewModel.isAllDataLoaded {
        cell.stopDisplaying()
      }
      
      return cell
      
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
      cell.bind(model: viewModel.dataSource[indexPath.item])
      return cell
      
    }
  }
  
}

extension MainViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard indexPath.item != viewModel.dataSource.count else { return }
    delegate?.seeDetail(recipe: viewModel.dataSource[indexPath.item])
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    if !isFetchingResult,
       viewModel.dataSource.count > 0,
       indexPath.row == viewModel.dataSource.count{
      getRecipes()
    }
  }
  
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if indexPath.item == viewModel.dataSource.count {
      return CGSize(width: UIScreen.width - 20, height: 60)
      
    } else {
      let width = (UIScreen.width - 20) / 2 - 5
      return CGSize(width: width, height: width + 50)
      
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
}

