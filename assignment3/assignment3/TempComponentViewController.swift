//
//  TempComponentViewController.swift
//  assignment3
//
//  Created by w0427115 on 2020-02-19.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class TempComponentViewController: UIViewController {

    @IBOutlet weak var tempSwitch: UISwitch!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var temptxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCalculate(_ sender: UIButton) {
        let temptxt1 = temptxt.text;
        let dNumber = NumberFormatter().number(from: temptxt1!);
        let nDouble = dNumber!;
        let eNumber = Double(truncating: nDouble);
        var tempt: Double = 0.00;

        if (tempSwitch.isOn == true){
             tempt = round((eNumber * 1.8) + 32);
            
        }else if (tempSwitch.isOn == false){
             tempt = round((eNumber - 32) / 1.8);
            
        }
        
        let message = "The temprature Conversion is \(tempt)";
   
        let alert = UIAlertController(title: "Temperature Conversion", message: message, preferredStyle: .alert);
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(dismissAction);
        present(alert, animated: true, completion: nil);
        
    }
    @IBAction func textFieldOnEditing(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    @IBAction func onTapGestureRecongize(_ sender: Any) {
        temptxt.resignFirstResponder();
    
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
