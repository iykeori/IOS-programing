//
//  ViewController.swift
//  swift2
//
//  Created by w0427115 on 2020-01-29.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var numberField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sliderLabel.text = "50";
    }

    @IBAction func OnSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))";
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            leftSwitch.isHidden = true;
            rightSwitch.isHidden = true;
            doSomethingButton.isHidden = false;
        }else if (sender.selectedSegmentIndex == 1){
            leftSwitch.isHidden = false;
            rightSwitch.isHidden = false;
            doSomethingButton.isHidden = true;
        }
        
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        
        let controller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet);
        let noAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil);
        let yesAction = UIAlertAction(title: "Yes I am sure", style: .destructive, handler: {action in
            
            var msg = "";
            if (self.nameField.text!.isEmpty){
                msg = "You can breathe easy, everything is OK";
            } else {
                msg = "you can breathe easy \(self.nameField.text!), everything is OK ";
            }
            /*
             let msg - (self.nameField.text!.isEmpty ) ? "You can breathe easy, evrything is OK" : "You can breathe easy \(self,nameField.text), everything is OK";
             
             */
            let controller2 = UIAlertController(title: "Something was done", message: msg, preferredStyle: .alert);
            let cancelAction = UIAlertAction(title: "Good", style: .cancel, handler: nil);
            controller2.addAction(cancelAction);
            self.present(controller2, animated: true, completion: nil);
            
        });
        
        controller.addAction(yesAction);
        controller.addAction(noAction);
        
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView = sender;
            ppc.sourceRect = sender.bounds;
            
        }
        present(controller, animated: true, completion: nil);
    }
    
    @IBAction func textFieldOnEditing(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn;
        leftSwitch.setOn(setting, animated: true);
        rightSwitch.setOn(setting, animated: true)
    }
    @IBAction func onTapGestureRecongize(_ sender: Any) {
        nameField.resignFirstResponder();
        numberField.resignFirstResponder();
    }
}

