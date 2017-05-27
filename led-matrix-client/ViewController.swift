//
//  ViewController.swift
//  led-matrix-client
//
//  Created by Josh Buchacher on 5/26/17.
//  Copyright © 2017 Josh Buchacher. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let socket = SocketIOClient(socketURL: URL(string: "http://127.0.0.1:3000")!, config: [.log(true), .forcePolling(true)])

        socket.on(clientEvent: .connect) { data, ack in
            print("socket connected")
        }

        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
