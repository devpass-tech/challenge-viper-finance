import Foundation
import UIKit

final class CreateAccountViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: CreateAccountPresenterInputProtocol

    // MARK: - Internal Properties

    // MARK: - Private Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.boldSystemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.keyboardType = .emailAddress
        textField.borderStyle = .line
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.boldSystemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.borderStyle = .line
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let feedbackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    private let createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Inits
    
    init(presenter: CreateAccountPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    // MARK: - Internal Methods
    
    @objc
    func didTapCreateButton() {
        presenter.createAccount(email: emailTextField.text ?? "",
                                password: passwordTextField.text ?? "")
    }
    
    // MARK: - Private Methods
    
    // MARK: - Actions
}

// MARK: - View Code
extension CreateAccountViewController {
    func setupView() {
        view.backgroundColor = .white
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(feedbackLabel)
        
        view.addSubview(stackView)
        view.addSubview(createButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            createButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            createButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            createButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

// MARK: - Presenter Output Protocol
extension CreateAccountViewController: CreateAccountPresenterOutputProtocol {
    func createAccountFailed(message: String) {
        feedbackLabel.text = message
        feedbackLabel.isHidden = false
    }
}
