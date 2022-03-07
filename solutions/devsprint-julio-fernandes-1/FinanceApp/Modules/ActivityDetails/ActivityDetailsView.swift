//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//
import UIKit

final class ActivityDetailsView: UIView {

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        
        return stackView
    }()

    let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.image = UIImage(named: "bag.circle.fill")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    let activityNameLabel: UILabel = {

        let label = UILabel()
        label.text = "Mall"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let categoryLabel: UILabel = {

        let label = UILabel()
        label.text = "Shopping"
        label.textAlignment = .center
        return label
    }()

    let priceContainerView: UIView = {

        let view = UIView()
        return view
    }()

    let priceLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$100"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()

    let timeLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8:57 AM"
        return label
    }()

    let reportIssueButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Report a issue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        return button
    }()


    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        priceContainerView.addSubview(priceLabel)
        priceContainerView.addSubview(timeLabel)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(activityNameLabel)
        stackView.addArrangedSubview(categoryLabel)
        stackView.addArrangedSubview(priceContainerView)

        addSubview(stackView)
        addSubview(reportIssueButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: reportIssueButton.topAnchor),

            priceLabel.centerXAnchor.constraint(equalTo: priceContainerView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceContainerView.centerYAnchor),
            timeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            timeLabel.centerXAnchor.constraint(equalTo: priceLabel.centerXAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),

            reportIssueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            reportIssueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            reportIssueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            reportIssueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
