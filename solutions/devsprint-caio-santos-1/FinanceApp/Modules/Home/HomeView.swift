//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {

    func didSelectActivity()
}

class HomeView: UIView {

    weak var delegate: HomeViewDelegate?

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    let homeHeaderView: HomeHeaderView = {

        let homeHeaderView = HomeHeaderView()
        return homeHeaderView
    }()

    lazy var activityListView: ActivityListView = {

        let activityListView = ActivityListView()
        activityListView.translatesAutoresizingMaskIntoConstraints = false
        activityListView.delegate = self
        return activityListView
    }()


    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(homeHeaderView)
        stackView.addArrangedSubview(activityListView)
        stackView.setCustomSpacing(32, after: homeHeaderView)
        addSubview(stackView)

        let estimatedHeight = CGFloat(activityListView.tableView.numberOfRows(inSection: 0))*ActivityListView.cellSize

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
}

extension HomeView: ActivityListViewDelegate {

    func didSelectedActivity() {

        delegate?.didSelectActivity()
    }
}
