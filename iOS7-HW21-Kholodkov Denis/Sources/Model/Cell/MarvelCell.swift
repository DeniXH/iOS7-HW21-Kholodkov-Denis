//
//  MarvelCell.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 02.11.2022.
//

import UIKit

protocol cellProtocol {
    func setDataToComic(element: Comic?)
}

class MarvelCell: UITableViewCell, cellProtocol {

    // MARK: - Varibles
    static let identifier = "MarvelCell"
    let networkLayer = NetworkLayer()


    // MARK: - UI Elements
    private lazy var firstImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MarvelCell.identifier)
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    func setDataToComic(element: Comic?) {
        networkLayer.configurateComic(element: element,
                                      firstLabel,
                                      nil,
                                      firstImage)
    }

    private func setupHierarchy() {
        addSubview(firstLabel)
        addSubview(firstImage)
    }

    // MARK: - Layout settings
    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.leadingValueCell),
            firstImage.topAnchor.constraint(equalTo: topAnchor, constant: Metric.topValueImageCell),
            firstImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Metric.bottomValueCell),
            firstImage.heightAnchor.constraint(equalTo: firstImage.widthAnchor, multiplier: Metric.heightImageMultiplierCell),

            firstLabel.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: Metric.leadingValueCell),
            firstLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: Metric.bottomValueCell),
            firstLabel.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
    }
}
