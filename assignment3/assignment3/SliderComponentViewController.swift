//
//  SliderComponentViewController.swift
//  assignment3
//
//  Created by w0427115 on 2020-02-19.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class SliderComponentViewController: UIViewController {

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderBar: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sliderLabel.text = "50";
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))";
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
