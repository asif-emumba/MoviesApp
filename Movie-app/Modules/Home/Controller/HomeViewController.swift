//
//  HomeViewController.swift
//  Movie-app
//
//  Created by Emumba on 17/01/2025.
//

import UIKit

class HomeViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    private let viewModel = HomeViewModel()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = CustomColors.backgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.additionalSafeAreaInsets.top = 0
        configureUI()
        configureCollectionView()
        configureViewModel()
    }
        //func to show section layout//
    private func getCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            self.viewModel.sections[sectionIndex].layoutSection
        }
    }
}

extension HomeViewController {
    private func configureUI() {
        view.backgroundColor = CustomColors.backgroundColor
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UserInfoCollectionViewCell.self, forCellWithReuseIdentifier: UserInfoCollectionViewCell.identifier)
        collectionView.register(MoviesSectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MoviesSectionHeaderView.reuseIdentifier)
        collectionView.register(MoviesSectionCell.self, forCellWithReuseIdentifier: MoviesSectionCell.identifier)
        collectionView.register(LoadingIndicatorCell.self, forCellWithReuseIdentifier: LoadingIndicatorCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.delegate = self
        viewModel.movieCellDelegate = self
        viewModel.fetchMoviesByCategory(category: .nowPlaying)
    }
}

    // MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
}

    // MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewModel.sections[indexPath.section]
        if section.items[indexPath.item] is LoadingCellItem {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingIndicatorCell.identifier, for: indexPath) as! LoadingIndicatorCell
            cell.activityIndicator.startAnimating()
            return cell
        } else {
            return section.items[indexPath.item].cellForItem(at: indexPath, in: collectionView)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: MoviesSectionHeaderView.reuseIdentifier,
            for: indexPath
        ) as! MoviesSectionHeaderView
        
        let section = viewModel.sections[indexPath.section] as? MoviesSection
        header.configure(with: section?.headerTitle ?? "")
        return header
    }

}

    //AllMovie Section Movie Tapped
extension HomeViewController: MovieCollectionViewCellItemDelegate {
    func MovieCollectionViewCellItemDidSelect(cell: MoviesSectionCell, cellItem: MoviesCellItem) {
        print("Movie section item tap goes here")
    }
}

extension HomeViewController: MovieHomeControllerViewModelDelegate {
    func reloadMovieData() {
        self.collectionView.reloadData()
    }
}
