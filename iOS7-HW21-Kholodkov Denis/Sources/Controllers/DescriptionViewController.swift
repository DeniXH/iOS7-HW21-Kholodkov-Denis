//
//  DescriptionViewController.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 04.11.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    // MARK: - Varibles
    var marvelCell = MarvelCell()
    
    var element: Comic? {
        didSet {
            guard let element = element else { return }
            nameLabel.text = element.title
            descriptionLabel.text = element.description
            DispatchQueue.global().async {
                guard let imagePath = self.marvelCell.getURLImg(path: element.thumbnail?.path,
                                                                size: .portrait,
                                                                ext: element.thumbnail?.imageExtension),
                      let imageURL = URL(string: imagePath),
                      let imageData = try? Data(contentsOf: imageURL) else {
                    DispatchQueue.main.async {
                        self.secondImage.image = UIImage(named: "default image")
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.secondImage.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    // MARK: - UI Elements
    private lazy var secondImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayaout()
    }
    
    func setupHierarchy() {
        view.addSubview(secondImage)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
    }
    
    // MARK: - Setup Layout
    func setupLayaout() {
        NSLayoutConstraint.activate([
            secondImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            secondImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            secondImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondImage.widthAnchor.constraint(equalTo: secondImage.heightAnchor, multiplier: 0.85),
            
            nameLabel.topAnchor.constraint(equalTo: secondImage.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
}
