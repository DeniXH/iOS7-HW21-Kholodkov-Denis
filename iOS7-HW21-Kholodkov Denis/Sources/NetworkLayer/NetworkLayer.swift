//
//  NetworkLayer.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 08.11.2022.
//

import UIKit

protocol OutputNetWorkLayerProtocol {
    func configurateComic(element: Comic?,
                          _ nameLabel: UILabel,
                          _ descriptionLabel: UILabel?,
                          _ firstImage: UIImageView)
}

struct NetworkLayer: OutputNetWorkLayerProtocol {

    func getURLImg(path: String?, size: ImageSize, ext: String?) -> String? {
        if let path = path, let ext = ext {
            let url = path + size.set + ext
            //  print(url)
            return url
        }
        return nil
    }

    func configurateComic(element: Comic?,
                          _ nameLabel: UILabel,
                          _ descriptionLabel: UILabel? = nil,
                          _ firstImage: UIImageView) {
        var sizePicture: ImageSize = .small
        nameLabel.text = element?.title
        if let descriptionLabel = descriptionLabel {
            descriptionLabel.text = element?.description
            sizePicture = .portrait
        }
        DispatchQueue.global().async {
            guard let imagePath = self.getURLImg(path: element?.thumbnail?.path,
                                                 size: sizePicture,
                                                 ext: element?.thumbnail?.imageExtension),
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL) else {
                DispatchQueue.main.async {
                    firstImage.image = UIImage(named: "default image")
                }
                return
            }
            DispatchQueue.main.async {
                //  print("\(imageURL)")
                firstImage.image = UIImage(data: imageData)
            }
        }
    }
}

