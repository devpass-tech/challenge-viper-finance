//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

// MARK: - HomeViewDelegate
protocol HomeViewDelegate: AnyObject {
    func didSelectActivity()
}

// MARK: - HomeView

final class HomeView: UIView {

    // MARK: Public Properties

    weak var delegate: HomeViewDelegate?

    // MARK: Private Properties

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    private lazy var homeHeaderView: HomeHeaderView = {
        let homeHeaderView = HomeHeaderView()
        return homeHeaderView
    }()

    private lazy var activityListView: ActivityListView = {
        let activityListView = ActivityListView()
        activityListView.translatesAutoresizingMaskIntoConstraints = false
        activityListView.delegate = self
        return activityListView
    }()

    // MARK: Init

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(homeHeaderView)
        stackView.addArrangedSubview(activityListView)
        stackView.setCustomSpacing(32, after: homeHeaderView)
        addSubview(stackView)

        let estimatedHeight = CGFloat(5)*ActivityListView.cellSize

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            activityListView.heightAnchor.constraint(equalToConstant: estimatedHeight)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public Methods

    func setupWithHomeData(_ homeData: HomeData) {
        // Header
        homeHeaderView.label.text = homeData.balance.toBRLCurrency()
        homeHeaderView.savingsValueLabel.text = homeData.savings.toBRLCurrency()
        homeHeaderView.spendingValueLabel.text = homeData.spending.toBRLCurrency()
        
        // List
        activityListView.items = homeData.activity
    }
}

// MARK: - ActivityListViewDelegate

extension HomeView: ActivityListViewDelegate {
    func didSelectedActivity() {
        delegate?.didSelectActivity()
    }
}
