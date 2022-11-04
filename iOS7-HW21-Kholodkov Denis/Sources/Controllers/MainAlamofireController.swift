//
//  MainAlamofireController.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 02.11.2022.
//

import UIKit
import Alamofire

class MainAlamofireController: UIViewController {

    var elemets: [Comic] = []

    // MARK: - create table
    private lazy var marvelTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.register(MarvelCell.self, forCellReuseIdentifier: MarvelCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "Marvel Comics"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
        fetchCharacter()
    }

    private func setupHierarchy() {
        view.addSubview(marvelTableView)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            marvelTableView.topAnchor.constraint(equalTo: view.topAnchor),
            marvelTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            marvelTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            marvelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Funcions
    private func fetchCharacter() {
        DispatchQueue.main.async {
            let request = AF.request(Metric.urlMarvel)
            request.responseDecodable(of: DataClass.self) { data in
                guard let part = data.value else { return }
                let elemets = part.data.results
                self.elemets = elemets
                self.marvelTableView.reloadData()
            }
        }
    }
}

// MARK: - Extensions
extension MainAlamofireController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elemets.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarvelCell.identifier, for: indexPath) as? MarvelCell
        cell?.element = elemets[indexPath.row]
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DescriptionViewController()
        viewController.element = elemets[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.present(viewController, animated: true)
    }
}
