//
//  ColorPickerViewController.swift
//  led-matrix-client
//
//  Created by Josh Buchacher on 5/27/17.
//  Copyright © 2017 Josh Buchacher. All rights reserved.
//

import UIKit

import UIKit

class ColorPickerViewController: UIViewController {
    var indexPath: IndexPath?
    var pixelController: PixelController?
    @IBOutlet weak var colorPickerView: HSBColorPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView!.delegate = self
        pixelController = PixelController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func close() {
        self.dismiss(animated: true)
    }
}

extension ColorPickerViewController: HSBColorPickerDelegate {
    func HSBColorColorPickerTouched(sender:HSBColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizerState) {
        pixelController!.setPixel(path: indexPath!, state: .On, color: color)
        dismiss(animated: true)
    }
}
