//
//  ViewController.swift
//  assignment1
//
//  Created by w0427115 on 2020-02-03.
//  Copyright © 2020 w0427115. All rights reserved.
//
//Based on the two iOS examples done in class last week, you will develop an app with the following specifications:
//
// “Screen 1”
//
//Add a slider and a label to the screen and add an outlet for each element
//Create an action to show the current value of the slider in the label
//Set the initial visibility of these elements to hidden
//“Screen 2”
//
//Add a date picker to the screen.
//Create the appropriate outlets and actions to have the date and time reflect the current date and time from your phone.
//Set the initial visibility of the element to hidden
//“Screen 3”
//
//Import 3 pictures into your app and display them in UIImageView containers. Resize so each image displays as 50px x 50px.
//Arrange in a 3x1 grid with a gap separating each image
//Add an outlet for each of these Image Views
//Add 3 switches to your app (to be displayed under the images).
//Each switch will show/hide one of the 3 images.
//Add an action for each switch to control the visibility of the images. If the switch state is ON, then the image will show. If the switch state is OFF, then the image will be hidden
//When the app starts, each image will be hidden but the switches will be visible
//Add a segmented control at the bottom of the screen with 3 options: images, slider, and picker. When the app starts, the images segment should be the active one.  The functionality of the segmented control is to be as follows:
//
//(1) When images segment is active, the date picker, slider, and slider label are to be hidden. The switches are made visible and each of the switches is checked to see which image to show. If a switch is “ON”, the corresponding image is visible.
//
//(2) When slider segment is active, the switches, images, and date picker are to be hidden. The slider and slider label are to be made visible.
//
//(3) When the picker segment is active, the switches, images, slider, and slider label are to be hidden. The date picker is to be made visible.
//
//Add a button above the segmented control. When pressed, this button will bring up an ActionSheet that tells you which elements are currently visible on the screen (by referencing the visibility property of each element combined with IF statements to create a single display message).

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var dateView: UIDatePicker!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var toggle: UISegmentedControl!
    @IBOutlet weak var showActiveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sliderLabel.text = "50";
        self.sliderLabel.isHidden = false;
        self.slider.isHidden = false;
        
    }

    @IBAction func onSliderChange(_ sender: UISlider) {
         sliderLabel.text = "\(lroundf(sender.value))";
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
    }
    
    
    @IBOutlet weak var imageView1Changed: UIImageView!
    
    
    
    @IBOutlet weak var imageView2Changed: UIImageView!
    
    
    
    @IBOutlet weak var imageView3Changed: UIImageView!
    
  
    @IBAction func switch3Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch3.setOn(setting, animated: true);
        
        if (switch3.isOn == true) {
            imageView3.isHidden = false;
        }else if (switch3.isOn == false) {
            imageView3.isHidden = true;
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
    
    
    @IBAction func switch1Changed(_ sender: UISwitch) {
        let setting = sender.isOn;
        switch1.setOn(setting, animated: true);
        
        if (switch1.isOn == true) {
            imageView1.isHidden = false;
        }else if (switch1.isOn == false) {
            imageView1.isHidden = true;
        }
        
    }
    
    
    @IBAction func toggleControl(_ sender: UISegmentedControl) {
        
        if(sender.selectedSegmentIndex == 0){
            slider.isHidden = false;
            sliderLabel.isHidden = false;
            switch1.isHidden = true;
            switch2.isHidden = true;
            switch3.isHidden = true;
            dateView.isHidden = true;
            imageView1.isHidden = true;
            imageView2.isHidden = true;
            imageView3.isHidden = true;
            
        } else if (sender.selectedSegmentIndex == 1){
            slider.isHidden = true;
            sliderLabel.isHidden = true;
            switch1.isHidden = true;
            switch2.isHidden = true;
            switch3.isHidden = true;
            dateView.isHidden = false;
            imageView1.isHidden = true;
            imageView2.isHidden = true;
            imageView3.isHidden = true;
        }else if (sender.selectedSegmentIndex == 2){
            slider.isHidden = true;
            sliderLabel.isHidden = true;
            switch1.isHidden = false;
            switch2.isHidden = false;
            switch3.isHidden = false;
            dateView.isHidden = true;
            imageView1.isHidden = false;
            imageView2.isHidden = false;
            imageView3.isHidden = false;
        }
    }
    
    @IBAction func showActive(_ sender: UIButton) {
        let controller = UIAlertController(title: "View Active List?", message: nil, preferredStyle: .actionSheet);
        let noAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil);
        let yesAction = UIAlertAction(title: "YES", style: .destructive, handler: {action
            in
            var msg = "";
            if(self.sliderLabel.isHidden == false && self.slider.isHidden == false){
                msg = "Slider and Slider Label is active";
                       
            } else if (self.dateView.isHidden == false){
                msg = "Date picker is active";
                    
            }else if (self.imageView1.isHidden == false && self.imageView2.isHidden == false && self.imageView3.isHidden == false && self.switch1.isHidden == false && self.switch2.isHidden == false && self.switch3.isHidden == false ){
                msg = "Three imageViews and Three Switches are active";
                       
            }
            
            let controller2 = UIAlertController(title: "ACTIVE COMPONENTS", message: msg, preferredStyle: .alert);
            let cancelAction = UIAlertAction(title: "EXIT", style: .cancel, handler: nil);
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
    
    
    
}

