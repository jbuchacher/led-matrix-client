//
//  ViewController.swift
//  led-matrix-client
//
//  Created by Josh Buchacher on 5/26/17.
//  Copyright © 2017 Josh Buchacher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let reuseIdentifier = "PixelCell"
    var pixelController: PixelController?

    override func viewDidLoad() {
        super.viewDidLoad()

        pixelController = PixelController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked: \(indexPath.section), \(indexPath.row)")
        pixelController!.setPixel(path: indexPath, state: .On, color: UIColor.blue)
    }
}
