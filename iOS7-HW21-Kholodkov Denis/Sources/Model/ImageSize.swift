//
//  ImageSize.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 04.11.2022.
//

import Foundation

enum ImageSize {
    case small
    case portrait
    case landscape

    var set: String {
        switch self {
        case .small:
            return "/standard_small."
        case .portrait:
            return "/portrait_uncanny."
        case .landscape:
            return "/landscape_small."
        }
    }
}
