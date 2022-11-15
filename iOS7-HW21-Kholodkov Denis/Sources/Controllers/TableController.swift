//
//  TableController.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 08.11.2022.
//

import UIKit
import Alamofire

protocol InputTableControllerProtocol {
    var tableMarvel: OutputTableViewProtocol? { get set }
}

class TableController: UIViewController, InputTableControllerProtocol {

    // MARK: - varibles
    var elemets: [Comic] = []
    var tableMarvel: OutputTableViewProtocol?

    // MARK: - LifeCycle
    override func loadView() {
        tableMarvel = MarvelTableView()
        view = tableMarvel as? UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleTable(Metric.titleMarvel)
        fetchCharacter(marvelTableView: tableMarvel?.marvelTableView ?? UITableView())
    }

    // MARK: - Funcions
    private func setTitleTable(_ nameTitle: String) {
        navigationItem.title = nameTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - upload table data by use Alamofire function
    func fetchCharacter(marvelTableView: UITableView) {
        marvelTableView.register(MarvelCell.self, forCellReuseIdentifier: MarvelCell.identifier)
        marvelTableView.dataSource = self
        marvelTableView.delegate = self
        let request = AF.request(Metric.urlMarvel)
        request.responseDecodable(of: DataClass.self) { data in
            guard let part = data.value else { return }
            let elemets = part.data.results
            self.elemets = elemets
            marvelTableView.reloadData()
        }
    }
}

// MARK: - Extensions
extension TableController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elemets.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarvelCell.identifier, for: indexPath) as? MarvelCell
        cell?.setDataToComic(element: elemets[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionController = DescriptionController()
        descriptionController.loadView() // почему - то не вызывается при создании объекта, поэтому вызвал здесь
        descriptionController.setDataToDescriptionScreen(element: elemets[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.present(descriptionController, animated: true)
    }
}
