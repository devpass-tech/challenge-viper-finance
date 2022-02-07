//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

final class ConfirmationView: UIView {
    

    var viewController: ConfirmationViewControllerProtocol?
    
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
        imageView.image = UIImage(named: "checkmark.circle.fill")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
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
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitle("BUTTON", for: .normal)
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(didTouchConfirmationButton), for: .touchUpInside)
        return button
    }()


    init(viewController: ConfirmationViewControllerProtocol) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        self.viewController = viewController
        
        confirmationButton.setTitle(self.viewController?.getButtonTitle(), for: .normal)
        confirmationLabel.text = self.viewController?.getText()
        confirmationImageView.tintColor = self.viewController?.getColorIcon()

        stackView.addArrangedSubview(confirmationImageView)
        stackView.addArrangedSubview(confirmationLabel)

        addSubview(stackView)
        addSubview(confirmationButton)

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
            confirmationButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc
    func didTouchConfirmationButton() {
        viewController?.dismissThisScreen()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
