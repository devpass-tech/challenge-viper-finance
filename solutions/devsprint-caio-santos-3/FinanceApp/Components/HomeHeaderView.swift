//
//  HomeHeaderView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

class HomeHeaderView: UIView {
        
    var viewController: HomeViewControllerInputProtocol?

    private lazy var  stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return stackView
    }()
    
    private lazy var  label: UILabel = {
        
        let label = UILabel()
        label.text = "$15,459.27"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    private lazy var  savingsStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var  savingsLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var  savingsValueLabel: UILabel = {
        
        let label = UILabel()
        label.text = "$100.00"
        label.textColor = .lightGray
        return label
    }()
    
    private let spendingStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var spendingLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Spending"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var  spendingValueLabel: UILabel = {
        
        let label = UILabel()
        label.text = "$100.00"
        label.textColor = .lightGray
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        savingsStackView.addArrangedSubview(savingsLabel)
        savingsStackView.addArrangedSubview(savingsValueLabel)
        
        spendingStackView.addArrangedSubview(spendingLabel)
        spendingStackView.addArrangedSubview(spendingValueLabel)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(savingsStackView)
        stackView.addArrangedSubview(spendingStackView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        guard let homeDTO = viewController?.getHomeData() else {
            return
        }
        
        self.label.text = homeDTO.balance
        self.savingsValueLabel.text = homeDTO.savings
        self.spendingValueLabel.text = homeDTO.spending
    }
}

