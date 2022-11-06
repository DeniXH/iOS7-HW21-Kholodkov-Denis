//
//  Metric.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 02.11.2022.
//

import Foundation

struct Metric {

    // MARK: - Main URL with hash
    static let urlMarvel = "https://gateway.marvel.com/v1/public/comics?ts=1&apikey=76e11f4cafd421488974a942a334254f&hash=097b0685fa5871c9487052504c2328d6"

    // MARK: - MarvelCell Layout values
    static let leadingValueCell: CGFloat = 15
    static let topValueImageCell: CGFloat = 5
    static let heightImageMultiplierCell: CGFloat = 0.69
    static let bottomValueCell: CGFloat = -5

    // MARK: - Descreption View Layout values
    static let topValue: CGFloat = 10
    static let leadingValueImage: CGFloat = 20
    static let trailingValueImage: CGFloat = -20
    static let multiplierValueImage: CGFloat = 0.85

    // Labels layout values
    static let leadingValueLabel: CGFloat = 15
    static let trailingValueLabel: CGFloat = -15
}
