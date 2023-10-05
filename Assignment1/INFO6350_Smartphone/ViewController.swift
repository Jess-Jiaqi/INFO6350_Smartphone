//
//  ViewController.swift
//  INFO6350_Smartphone
//
//  Created by Jiaqi Li on 9/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityImage.image = UIImage(named: "seattle")
    }

    @IBAction func seattleBtn(_ sender: Any) {
        cityImage.image = UIImage(named: "seattle")
    }
    
    @IBAction func losAngelesBtn(_ sender: Any) {
        cityImage.image = UIImage(named: "losangeles")
    }
    
    @IBAction func austinBtn(_ sender: Any) {
        cityImage.image = UIImage(named: "austin")
    }
    
    @IBAction func newYorkBtn(_ sender: Any) {
        cityImage.image = UIImage(named: "newyork")
    }
    
    @IBAction func lasVegasBtn(_ sender: Any) {
        cityImage.image = UIImage(named: "lasvegas")
    }
}

