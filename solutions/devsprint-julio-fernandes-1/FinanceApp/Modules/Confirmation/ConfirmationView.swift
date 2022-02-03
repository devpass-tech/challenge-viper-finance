//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

enum ConfirmationViewState {
    case loading
    case loaded(Confirmation)
}

struct Confirmation {
    let success: Bool
    let image: UIImage?
    let message: String
}

final class ConfirmationView: UIView {

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()

    let confirmationImageView: UIImageView = {

        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.tintColor = .systemGreen
        return imageView
    }()

    let confirmationLabel: UILabel = {

        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    let confirmationButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nice!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        return button
    }()

    let loadingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    var state: ConfirmationViewState = .loading {
        didSet {
            configureView()
        }
    }

    init(state: ConfirmationViewState) {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(confirmationImageView)
        stackView.addArrangedSubview(confirmationLabel)

        addSubview(stackView)
        addSubview(confirmationButton)
        addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            confirmationImageView.heightAnchor.constraint(equalToConstant: 100),
            confirmationImageView.widthAnchor.constraint(equalToConstant: 100),

            confirmationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmationButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            confirmationButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            confirmationButton.heightAnchor.constraint(equalToConstant: 56),

            loadingIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])

        configureView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        switch self.state {
        case .loaded(let confirmation):
            loadingIndicator.stopAnimating()
            loadingIndicator.isHidden = true
            stackView.isHidden = false

            confirmationImageView.image = confirmation.image
            confirmationLabel.text = confirmation.message
        case .loading:
            loadingIndicator.startAnimating()
            loadingIndicator.isHidden = false
            stackView.isHidden = true
        }
    }
}
