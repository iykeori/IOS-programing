//
//  ImageComponentViewController.swift
//  assignment3
//
//  Created by w0427115 on 2020-02-19.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class ImageComponentViewController: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var switch6: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var imageView6Changed: UIImageView!
    @IBOutlet weak var imageView5Changed: UIImageView!
    @IBOutlet weak var imageView4Changed: UIImageView!
    @IBOutlet weak var imageView3Changed: UIImageView!
    @IBOutlet weak var imageView2Changed: UIImageView!
    @IBOutlet weak var imageView1Changed: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func switch4Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch4.setOn(setting, animated: true);
        
        if (switch4.isOn == true) {
          imageView4.isHidden = false;
            
        }else if (switch4.isOn == false) {
          imageView4.isHidden = true;
        }
    }
    
    @IBAction func switch3Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch3.setOn(setting, animated: true);
        
        if (switch3.isOn == true) {
          imageView3.isHidden = false;
            
        }else if (switch3.isOn == false) {
          imageView3.isHidden = true;
        }
    }
    
    @IBAction func switch1Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch1.setOn(setting, animated: true);
        
        if (switch1.isOn == true) {
          imageView1.isHidden = false;
            
        }else if (switch1.isOn == false) {
          imageView1.isHidden = true;
        }
    }
    
    @IBAction func switch2Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch2.setOn(setting, animated: true);
        
        if (switch2.isOn == true) {
          imageView2.isHidden = false;
            
        }else if (switch2.isOn == false) {
          imageView2.isHidden = true;
        }
    }
    
    @IBAction func switch5Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch5.setOn(setting, animated: true);
        
        if (switch5.isOn == true) {
          imageView5.isHidden = false;
            
        }else if (switch5.isOn == false) {
          imageView5.isHidden = true;
        }
    }
    
    @IBAction func switch6Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch6.setOn(setting, animated: true);
        
        if (switch6.isOn == true) {
          imageView6.isHidden = false;
            
        }else if (switch6.isOn == false) {
          imageView6.isHidden = true;
        }
    }
    
}
