//
//  HomeViewController.swift
//  Movie-app
//
//  Created by Emumba on 17/01/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let coordinator: MainCoordinator
    private let viewModel : HomeViewModel
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = CustomColors.backgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(coordinator: MainCoordinator, viewModel: HomeViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        collectionView.register(MovieHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MoviesSectionHeaderView.reuseIdentifier)
        collectionView.register(NowPlayingMoviesCollectionViewCell.self, forCellWithReuseIdentifier: NowPlayingMoviesCollectionViewCell.identifier)
        collectionView.register(LoadingIndicatorCollectionViewCell.self, forCellWithReuseIdentifier: LoadingIndicatorCollectionViewCell.identifier)
        collectionView.register(NowPlayingMoviesCollectionViewCell.self, forCellWithReuseIdentifier: NowPlayingMoviesCollectionViewCell.identifier)
        collectionView.register(LoadingIndicatorCollectionViewCell.self, forCellWithReuseIdentifier: LoadingIndicatorCollectionViewCell.identifier)
        collectionView.register(UpComingMovieCollectionViewCell.self, forCellWithReuseIdentifier: UpComingMovieCollectionViewCell.identifier)
        collectionView.register(PromoAndDiscountCollectionViewCell.self, forCellWithReuseIdentifier: PromoAndDiscountCollectionViewCell.identifier)
        collectionView.register(ServicesCollectionViewCell.self, forCellWithReuseIdentifier: ServicesCollectionViewCell.identifier)
        collectionView.register(MovieNewsCollectionViewCell.self, forCellWithReuseIdentifier: MovieNewsCollectionViewCell.identifier)
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
        viewModel.upcomingMovieCellDelegate = self
        viewModel.fetchMoviesByCategory(category: .nowPlaying)
        viewModel.fetchMoviesByCategory(category: .upcoming)
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
        if section.items[indexPath.item] is LoadingIndicatorCollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingIndicatorCollectionViewCell.identifier, for: indexPath) as! LoadingIndicatorCollectionViewCell
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
            withReuseIdentifier: MovieHeaderCollectionReusableView.reuseIdentifier,
            for: indexPath
        ) as! MovieHeaderCollectionReusableView
        
        let section = viewModel.sections[indexPath.section]
        header.configure(with: section.headerTitle ?? "")
       
        return header
    }

}

//AllMovie Section Movie Tapped
extension HomeViewController: NowPlayingMovieCollectionViewCellItemDelegate {
    func movieCollectionViewCellItemDidSelect(cell: NowPlayingMoviesCollectionViewCell, cellItem: NowPlayingMovieSectionCellItem) {
        coordinator.navigateToDetail(movieDetails: cellItem.item)
    }
}

extension HomeViewController: UpComingMovieCollectionViewCellItemDelegate {
    func upComingMovieCollectionViewCellItemDidSelect(cell: UpComingMovieCollectionViewCell, cellItem: UpComingMovieSectionCellItem) {
        coordinator.navigateToDetail(movieDetails: cellItem.item)
        print("Tapped detected from UpComingMovieCollectionViewCellItemDelegate \(cellItem.item.id) named as \(cellItem.item.title)")
    }
}

extension HomeViewController: MovieHomeControllerViewModelDelegate {
    func reloadMovieData() {
        self.collectionView.reloadData()
    }
}
