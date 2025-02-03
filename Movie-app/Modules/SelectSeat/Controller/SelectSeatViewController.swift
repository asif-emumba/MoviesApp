//
//  SelectSeatViewController.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

class SelectSeatViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    private let viewModel: SelectSeatViewModel
    let gradientBorderView = GradientTopBorderView()
    let appBarView = AppBarView()
    let buyTicketView = BuyTicketView()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = CustomColors.backgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(viewModel: SelectSeatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appBarView.delegate = self
        configureAppBar()
        configureUi()
    }
    
    //func to show section layout//
    private func getCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            self.viewModel.sections[sectionIndex].layoutSection
        }
    }
    
    private func configureUi() {
        view.addSubview(appBarView)
        view.addSubview(buyTicketView)
        setUpConstrains()
        configureViewModel()
    }
    
    private func configureAppBar() {
        appBarView.delegate = self
        buyTicketView.delegate = self
        appBarView.setTitle("Select Seat")
        buyTicketView.setPriceLabel(price: viewModel.cinemaDetails.price)
        
    }
    
    private func setUpConstrains() {
        gradientBorderView.frame = CGRect(x: 0, y: 84, width: view.bounds.width, height: 84)
        gradientBorderView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gradientBorderView)
        view.addSubview(collectionView)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(SeatCollectionViewCell.self, forCellWithReuseIdentifier: SeatCollectionViewCell.identifier)
        collectionView.register(StatusViewCollectionViewCell.self, forCellWithReuseIdentifier: StatusViewCollectionViewCell.identifier)
        collectionView.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: DateCollectionViewCell.identifier)
        collectionView.register(TimeCollectionViewCell.self, forCellWithReuseIdentifier: TimeCollectionViewCell.identifier)
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
            
            gradientBorderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientBorderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientBorderView.topAnchor.constraint(equalTo: appBarView.bottomAnchor, constant: 32),
            gradientBorderView.heightAnchor.constraint(equalToConstant: 110), // Set desired height
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: gradientBorderView.bottomAnchor),
            
            buyTicketView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            buyTicketView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buyTicketView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buyTicketView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buyTicketView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func configureViewModel() {
        viewModel.delegate = self
        viewModel.seatCellDelegate = self
        viewModel.dateDelegate = self
        viewModel.timeDelegate = self
        viewModel.fetchSeats()
    }
    
}

// MARK: - UICollectionViewDelegate
extension SelectSeatViewController: UICollectionViewDelegate {
}

// MARK: - UICollectionViewDataSource
extension SelectSeatViewController: UICollectionViewDataSource {
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

extension SelectSeatViewController: SelectSeatViewModelDelegate {
    func reloadSeatData() {
        self.collectionView.reloadData()
    }
}

extension SelectSeatViewController: AppBarDelegate {
    func didTapBackButton() {
        coordinator?.popToRootViewController()
    }
}

extension SelectSeatViewController: SeatCollectionViewCellItemDelegate {
    func seatCollectionViewCellItemDidSelect(cell: SeatCollectionViewCell, cellItem: SeatCollectionViewCellItem) {
        let selectedSeats = viewModel.selectedSeats
        print("Selected Seats:", selectedSeats.map{ $0.id })
    }
}

extension SelectSeatViewController: DateSectionCellItemDelegate {
    func dateCollectionViewCellItemDidSelect(cell: DateCollectionViewCell, cellItem: DateSectionCellItem) {
        print("Selected Data is : \(cellItem.item.formattedDate)")
        if let indexPath = collectionView.indexPath(for: cell) {
            viewModel.updateSelectedDate(to: indexPath.item)
        }
    }
}

extension SelectSeatViewController: TimeSectionCellItemDelegate {
    func timeCollectionViewCellItemDidSelect(cell: TimeCollectionViewCell, cellItem: TimeSectionCellItem) {
        print("Selected Time is : \(cellItem.item.formattedTime)")
        if let indexPath = collectionView.indexPath(for: cell) {
            viewModel.updateSelectedTime(to: indexPath.item)
        }
    }
}

extension SelectSeatViewController: BuyTimeTicketDelegate {
    func buyTicketButtonTap() {
        let selectedDate = viewModel.sessionDays.first { $0.isSelected }
        let selectedTime = viewModel.sessionTime.first { $0.isSelected }
        let selectedCinema = viewModel.cinemaDetails
        if selectedDate == nil || selectedTime == nil {
            return
        }
        coordinator?.navigateToPayment(movieDetails: viewModel.movieDetails, cinemaDetails: selectedCinema, selectedSeats: viewModel.selectedSeats, selectedDate: selectedDate!, selectedTime: selectedTime!)
    }
}
