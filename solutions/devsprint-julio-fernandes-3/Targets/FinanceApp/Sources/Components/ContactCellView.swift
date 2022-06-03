//
//  ContactCellView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactCellView: UITableViewCell {
   static let cellSize = CGFloat(82)
   static let cellIdentifier = "ContactCellIdentifier"
   
    private var mainStackView: UIStackView = {
       let stack = UIStackView(frame: .zero)
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.spacing = 16
       stack.alignment = .center
       return stack
    }()

    private var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    lazy var contactPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator

        addSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    override func prepareForReuse() {
        avatarImageView.image = UIImage(named: "avatar-placeholder")
        contactNameLabel.text = ""
        contactPhoneLabel.text = ""
    }
    
    func setupContactCell(contact: ContactEntity) {
        contactNameLabel.text = contact.name
        contactPhoneLabel.text = contact.phone
    }
}

extension ContactCellView {

    func addSubviews() {

        addSubview(mainStackView)
        mainStackView.addArrangedSubview(avatarImageView)
        mainStackView.addArrangedSubview(labelsStackView)

        labelsStackView.addArrangedSubview(contactNameLabel)
        labelsStackView.addArrangedSubview(contactPhoneLabel)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            self.avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}

