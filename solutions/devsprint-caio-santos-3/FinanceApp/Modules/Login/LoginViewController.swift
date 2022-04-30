import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: LoginPresenterInputProtocol

    // MARK: - Internal Properties
    

    // MARK: - Private Properties
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.boldSystemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.keyboardType = .emailAddress
        textField.borderStyle = .line
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.boldSystemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.borderStyle = .line
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    lazy var feedbackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        return button
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Inits
    
    init(presenter: LoginPresenterInputProtocol) {
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
    func didTapCreateAccountButton() {
        presenter.showCreateAccountView()
    }

    @objc
    func didTapLoginButton() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
                  return
              }
        
        presenter.authenticate(email: email, password: password)
    }
    
    // MARK: - Private Methods
    
    
    
    // MARK: - Actions
}

// MARK: - View Code
extension LoginViewController {
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
        stackView.addArrangedSubview(createAccountButton)
        
        view.addSubview(stackView)
        view.addSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

// MARK: - Presenter Output Protocol
extension LoginViewController: LoginPresenterOutputProtocol {
    func authenticationFailed(message: String) {
        feedbackLabel.text = message
        feedbackLabel.isHidden = false
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
