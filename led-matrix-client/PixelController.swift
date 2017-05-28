//
//  PixelController.swift
//  led-matrix-client
//
//  Created by Josh Buchacher on 5/27/17.
//  Copyright © 2017 Josh Buchacher. All rights reserved.
//

import UIKit

enum PixelState: Int {
    case Off
    case On
}

class PixelController: NSObject {
    var socket:SocketIOClient?

    func initSocket() {
        socket = SocketIOClient(socketURL: URL(string: "http://192.168.0.7:3000")!, config: [.log(true), .forcePolling(true)])
        socket!.on(clientEvent: .connect) { data, ack in
            print("socket connected")
            self.socket!.emit("resetPixels")
        }

        socket!.connect()
    }

    func setPixel(path: IndexPath, state: PixelState, color: UIColor) {
        let rgb: [CGFloat] = Array(color.cgColor.components!.prefix(3))
        print(rgb)
        socket!.emit("setPixel", [ "column": path.row,
                                   "row": path.section,
                                   "state": state.rawValue,
                                   "rgb": rgb])
    }
}
