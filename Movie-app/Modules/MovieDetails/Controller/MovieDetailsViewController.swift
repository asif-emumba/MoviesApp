//
//  MovieDetailsViewController.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    private let viewModel: MovieDetailsViewModel
    let appBarView = AppBarView()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = CustomColors.backgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let continueButton = ContinueButtonView()
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    private func configureUI() {
        view.backgroundColor = CustomColors.backgroundColor
        view.addSubview(appBarView)
        view.addSubview(collectionView)
        view.addSubview(continueButton)
        view.bringSubviewToFront(appBarView)
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(MovieDetailsCoverCollectionViewCell.self, forCellWithReuseIdentifier: MovieDetailsCoverCollectionViewCell.identifier)
        collectionView.register(MovieDirectorCollectionViewCell.self, forCellWithReuseIdentifier: MovieDirectorCollectionViewCell.identifier)
        collectionView.register(MovieActorCollectionViewCell.self, forCellWithReuseIdentifier: MovieActorCollectionViewCell.identifier)
        collectionView.register(CinemaCollectionViewCell.self, forCellWithReuseIdentifier: CinemaCollectionViewCell.identifier)
        collectionView.register(MovieHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MovieHeaderCollectionReusableView.reuseIdentifier)
        collectionView.register(MovieStoryLineCollectionViewCell.self, forCellWithReuseIdentifier: MovieStoryLineCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            appBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appBarView.heightAnchor.constraint(equalToConstant: 48),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            continueButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            continueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func configureViewModel() {
        viewModel.delegate = self
        viewModel.cinemaDelegate = self
        appBarView.delegate = self
        continueButton.delegate = self
        viewModel.fetchMovieDetails()
    }
    
}

// MARK: - UICollectionViewDelegate
extension MovieDetailsViewController: UICollectionViewDelegate {
}

// MARK: - UICollectionViewDataSource
extension MovieDetailsViewController: UICollectionViewDataSource {
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

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func reloadMovieDetailsData() {
        collectionView.reloadData()
    }
}

extension MovieDetailsViewController: CinemaSectionCellItemDelegate {
    func cinemaCollectionViewCellItemDidSelect(cell: CinemaCollectionViewCell, cellItem: CinemaSectionCellItem) {
        if let indexPath = collectionView.indexPath(for: cell) {
            viewModel.updateSelectedCinema(to: indexPath.item)
        }
    }
}

extension MovieDetailsViewController: AppBarDelegate {
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension MovieDetailsViewController: ContinueButtonViewDelegate {
    func continueButtonTapped() {
        let selectedCinema = viewModel.cinemaData.first(where: { $0.isSelected })
        if selectedCinema == nil {
            return
        }
        coordinator?.navigateToSelectSeats(movieDetails: viewModel.movieDetails, cinemaDetails: selectedCinema ?? viewModel.cinemaData.first!)
    }
}
