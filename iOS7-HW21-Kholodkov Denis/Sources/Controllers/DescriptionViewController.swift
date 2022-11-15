//
//  DescriptionController.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 04.11.2022.
//

import UIKit

protocol InputDescriptionControllerProtocol {
    var decriptionView: OutputlDescriptionViewProtocol? { get set }
    var networkLayer: OutputNetWorkLayerProtocol? { get set }
}

class DescriptionController: UIViewController, InputDescriptionControllerProtocol {


    // MARK: - varibles
    var decriptionView: OutputlDescriptionViewProtocol?
    var networkLayer: OutputNetWorkLayerProtocol?

    // MARK: - LifeCicle
    override func loadView() {
        decriptionView = MarvelDescriptionView()
        view = decriptionView as? UIView
        networkLayer = NetworkLayer()
    }

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setDataToDescriptionScreen(element: Comic?) {
        networkLayer?.configurateComic(element: element,
                                       decriptionView?.nameLabel ?? UILabel(),
                                       decriptionView?.descriptionLabel ?? UILabel(),
                                       decriptionView?.secondImage ?? UIImageView())
    }
}
