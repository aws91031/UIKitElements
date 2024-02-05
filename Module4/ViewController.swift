//
//  ViewController.swift
//  Module4
//
//  Created by user250993 on 2/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentTime()
    }

    private func getCurrentTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.changeBackground) , userInfo: nil, repeats: true)    }
    
    @objc func currentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
        label1.text = formatter.string(from: Date())
    }
    
    @objc func changeBackground() {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12 {
            view.layer.contents = #imageLiteral(resourceName: "sunny2.jpg").cgImage
        } else {
            view.layer.contents = #imageLiteral(resourceName: "night").cgImage
        }
    }
}
