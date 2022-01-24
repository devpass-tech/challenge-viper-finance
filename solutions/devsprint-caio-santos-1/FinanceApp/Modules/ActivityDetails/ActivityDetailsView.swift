//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

class ActivityDetailsView: UIView {

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    let ActivityDetailsHeaderView: ActivityDetailsHeaderView = {

        let ActivityDetailsHeaderView = ActivityDetailsHeaderView()
        return ActivityDetailsHeaderView
    }()

    let activityListView: ActivityListView = {

        let activityListView = ActivityListView()
        activityListView.translatesAutoresizingMaskIntoConstraints = false
        return activityListView
    }()


    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(ActivityDetailsHeaderView)
        stackView.addArrangedSubview(activityListView)
        stackView.setCustomSpacing(32, after: ActivityDetailsHeaderView)
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

extension ActivityDetailsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "Spending"
        return cell
    }
}
