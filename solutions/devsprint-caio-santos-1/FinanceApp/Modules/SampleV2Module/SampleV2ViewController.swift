//
//  SampleV2ViewController.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import UIKit

final class SampleV2ViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: SampleV2PresenterInputProtocol

    // MARK: - Internal Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    // MARK: - Private Properties

    // MARK: - Inits
    
    init(presenter: SampleV2PresenterInputProtocol) {
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
    
    // MARK: - Private Methods
    private func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    // MARK: - Actions
}

// MARK: - View Code
extension SampleV2ViewController {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension SampleV2ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = presenter.getTextForCell(at: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch presenter.getCellType(at: indexPath) {
        case .cell1:
            // Do something
            break
        case .cell2:
            // Do something
            break
        case .cellN:
            // Do something
            break
        default:
            return
        }
    }
}


// MARK: - Presenter Output Protocol
extension SampleV2ViewController: SampleV2PresenterOutputProtocol {
    func presentLoadingState() {
        // TODO: Show loading
    }
    
    func presentEntityData() {
        tableView.reloadData()
    }
    
    func presentErrorState() {
        // TODO: Show error
    }
}
