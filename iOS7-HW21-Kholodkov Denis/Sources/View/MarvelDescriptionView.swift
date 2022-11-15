//
//  MarvelDescriptionView.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 07.11.2022.
//

import UIKit

protocol OutputlDescriptionViewProtocol {
    var secondImage: UIImageView { get set }
    var nameLabel: UILabel { get set }
    var descriptionLabel: UILabel { get set }
}

class MarvelDescriptionView: BaseViewElements, OutputlDescriptionViewProtocol {

    // MARK: - Varibles and constants
    lazy var secondImage = createImage()
    lazy var nameLabel = createDetailLabel()
    lazy var descriptionLabel = createDetailLabel()

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
        addSubview(secondImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            secondImage.topAnchor.constraint(equalTo: topAnchor, constant: Metric.topValue),
            secondImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.leadingValueImage),
            secondImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metric.trailingValueImage),
            secondImage.widthAnchor.constraint(equalTo: secondImage.heightAnchor, multiplier: Metric.multiplierValueImage),

            nameLabel.topAnchor.constraint(equalTo: secondImage.bottomAnchor, constant: Metric.topValue),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.leadingValueLabel),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metric.trailingValueLabel),

            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Metric.topValue),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.leadingValueLabel),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metric.trailingValueLabel)
        ])
    }
}
