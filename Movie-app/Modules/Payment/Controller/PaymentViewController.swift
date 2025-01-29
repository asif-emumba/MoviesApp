//
//  PaymentViewController.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import UIKit

class PaymentViewController: UIViewController {
   
    let coordinator: MainCoordinator?
    let viewModel: PaymentViewModel
    let appBarView = AppBarView()
    private var timerView = TimerView()
    private let continueButton = ContinueButtonView()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = CustomColors.backgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(coordinator: MainCoordinator?, viewModel: PaymentViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        configureAppBar()
        setupTimerView()
    }
    
    //func to show section layout//
    private func getCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            self.viewModel.sections[sectionIndex].layoutSection
        }
    }
    
    private func configureUi() {
        view.addSubview(appBarView)
        view.addSubview(timerView)
        view.addSubview(continueButton)
        setUpConstrains()
        configureViewModel()
    }
    
    private func configureAppBar() {
        appBarView.delegate = self
        appBarView.setTitle("Payment")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timerView.startTimer()
    }
    
    private func setupTimerView() {
        timerView.delegate = self
    }

}

extension PaymentViewController {
    private func setUpConstrains() {
        view.addSubview(collectionView)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(PaymentMovieCoverCollectionViewCell.self, forCellWithReuseIdentifier: PaymentMovieCoverCollectionViewCell.identifier)
        collectionView.register(SeatAndPriceCollectionViewCell.self, forCellWithReuseIdentifier: SeatAndPriceCollectionViewCell.identifier)
        collectionView.register(PaymentGatewayCollectionViewCell.self, forCellWithReuseIdentifier: PaymentGatewayCollectionViewCell.identifier)
        collectionView.register(MovieHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MovieHeaderCollectionReusableView.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        NSLayoutConstraint.activate([
            appBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            appBarView.heightAnchor.constraint(equalToConstant: 48),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: appBarView.bottomAnchor),
            
            timerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 32),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timerView.heightAnchor.constraint(equalToConstant: 52),
            
            continueButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 16),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            continueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func configureViewModel() {
        viewModel.delegete = self
        viewModel.paymentGatewayDelegate = self
        continueButton.delegate = self
        viewModel.updateMovieInfoData()
    }
}

// MARK: - UICollectionViewDelegate
extension PaymentViewController: UICollectionViewDelegate {
}

// MARK: - UICollectionViewDataSource
extension PaymentViewController: UICollectionViewDataSource {
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

extension PaymentViewController: AppBarDelegate {
    func didTapBackButton() {
        coordinator?.popToRootViewController()
    }
}

extension PaymentViewController: PaymentViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension PaymentViewController: PaymentGatewaySectionCellItemDelegate {
    func paymentGatewaySectionCellItemDidSelect(cell: PaymentGatewayCollectionViewCell, cellItem: PaymentGatewaySectionCellItem) {
        if let indexPath = collectionView.indexPath(for: cell) {
            viewModel.updateSelectedPayment(to: indexPath.item)
        }
    }
}

extension PaymentViewController: TimerCompletionDelegate {
    func timerDidComplete() {
        coordinator?.popToRootViewController()
    }
}

extension PaymentViewController: ContinueButtonViewDelegate {
    func continueButtonTapped() {
        coordinator?.navigateToTicket(movieDetails: viewModel.movieDetails, cinemaDetails: viewModel.cinemaDetails, selectedSeats: viewModel.selectedSeats, selectedDate: viewModel.selectedDate, selectedTime: viewModel.selectedTime)
    }
}
