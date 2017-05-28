//
//  ColorPickerViewController.swift
//  led-matrix-client
//
//  Created by Josh Buchacher on 5/27/17.
//  Copyright © 2017 Josh Buchacher. All rights reserved.
//

import UIKit

import UIKit

class ColorPickerViewController: UIViewController, HSBColorPickerDelegate {
    var indexPath: IndexPath?
    var pixelController: PixelController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pixelController = PixelController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func HSBColorColorPickerTouched(sender:HSBColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizerState) {
        pixelController!.setPixel(path: indexPath!, state: .On, color: UIColor.blue)
    }

    @IBAction func close() {
        self.dismiss(animated: true)
    }
}
