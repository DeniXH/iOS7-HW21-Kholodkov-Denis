//
//  MarvelCell.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 02.11.2022.
//

import UIKit

class MarvelCell: UITableViewCell {

    // MARK: - Varibles
    static let identifier = "MarvelCell"

    var element: Comic? {
        didSet {
            firstLabel.text = element?.title
            DispatchQueue.global().async {
                guard let imagePath = self.getURLImg(path: self.element?.thumbnail?.path,
                                                     size: .small,
                                                     ext: self.element?.thumbnail?.imageExtension),
                      let imageURL = URL(string: imagePath),
                      let imageData = try? Data(contentsOf: imageURL) else {
                    DispatchQueue.main.async {
                        self.firstImage.image = UIImage(named: "default image")
                    }
                    return
                }
                DispatchQueue.main.async {
                    //  print("\(imageURL)")
                    self.firstImage.image = UIImage(data: imageData)
                }
            }
        }
    }

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MarvelCell.identifier)
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Functions
    func getURLImg(path: String?, size: ImageSize, ext: String?) -> String? {
        if let path = path, let ext = ext {
            let url = path + size.set + ext
            //  print(url)
            return url
        }
        return nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(firstLabel)
        addSubview(firstImage)
    }

    // MARK: - Layout settings
    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            firstImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            firstImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            firstImage.heightAnchor.constraint(equalTo: firstImage.widthAnchor, multiplier: 0.69),

            firstLabel.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 15),
            firstLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            firstLabel.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
    }
}
