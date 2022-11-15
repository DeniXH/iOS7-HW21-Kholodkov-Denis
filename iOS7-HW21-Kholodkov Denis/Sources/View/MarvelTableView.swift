//
//  MarvelTableView.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 07.11.2022.
//

import UIKit

protocol OutputTableViewProtocol {
    var marvelTableView: UITableView { get set }
}

class MarvelTableView: BaseViewElements, OutputTableViewProtocol {

    // MARK: - Varibles and constants
    var controller: InputTableControllerProtocol?
    lazy var marvelTableView = createTable()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - functions
    private func setupHierarchy() {
        addSubview(marvelTableView)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            marvelTableView.topAnchor.constraint(equalTo: topAnchor),
            marvelTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            marvelTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            marvelTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
