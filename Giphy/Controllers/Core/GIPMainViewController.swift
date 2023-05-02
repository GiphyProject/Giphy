//
//  GIPMainVC.swift
//  Giphy
//
//  Created by Стас on 24.04.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class GIPMainViewController: UIViewController {
    
    private let mainView = GIPMainView()
    private let disposeBag = DisposeBag()
    var viewModel: GIPMainViewViewModel?
    var coordinator: MainCoordinator?
    
    var items = Observable.of([UIImage(systemName: "house"), UIImage(systemName: "pencil.circle")])
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupBehavior()
        setupConstraints()
        setupCollectionView()
        viewModel?.fetchData()
    }
    
    // MARK: - Embed view
    private func embedView() {
        view.addSubview(mainView)
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        view.backgroundColor = .systemBackground
        title = Str.titleMainViewController
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Setup collection view
    func setupCollectionView() {
        items
            .bind(to: mainView.collectionView.rx.items(
                cellIdentifier: GIPMainViewCollectionViewCell.cellIdentifier,
                cellType: GIPMainViewCollectionViewCell.self)) { row, element, cell in
                    cell.configure(element!)
                }.disposed(by: disposeBag)
        
        mainView.collectionView.rx.itemSelected
              .subscribe(onNext: { indexPath in
                  self.coordinator?.showDetail()
              })
              .disposed(by: disposeBag)
    }
}
