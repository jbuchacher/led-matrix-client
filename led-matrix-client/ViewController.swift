//
//  ViewController.swift
//  led-matrix-client
//
//  Created by Josh Buchacher on 5/26/17.
//  Copyright © 2017 Josh Buchacher. All rights reserved.
//

import UIKit

let b = UIColor.black

class ViewController: UIViewController {
    fileprivate var pixels = [
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
        Array(arrayLiteral: b, b, b, b, b, b, b, b),
    ]
    fileprivate let reuseIdentifier = "PixelCell"
    var selectedIndexPath: IndexPath?
    var pixelController: PixelController?
    var colorPickerViewController: ColorPickerViewController?
    @IBOutlet weak var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        pixelController = PixelController()
        pixelController!.initSocket()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pixels.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return pixels[section].count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
        cell.backgroundColor = pixels[indexPath.section][indexPath.row]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked: \(indexPath.section), \(indexPath.row)")
        selectedIndexPath = indexPath
        colorPickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as? ColorPickerViewController
        present(colorPickerViewController!, animated: true) {
            self.colorPickerViewController!.colorPickerView!.delegate = self
        }
    }
}

extension ViewController: HSBColorPickerDelegate {
    func HSBColorColorPickerTouched(sender:HSBColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizerState) {
        pixelController!.setPixel(path: selectedIndexPath!, state: .On, color: color)
        colorPickerViewController!.dismiss(animated: true)
        pixels[(selectedIndexPath?.section)!][(selectedIndexPath?.row)!] = color
        collectionView?.reloadItems(at: [selectedIndexPath!])
    }
}
