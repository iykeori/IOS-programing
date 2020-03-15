//
//  CustomComponentPickerViewController.swift
//  Pickers
//
//  Created by w0427115 on 2020-02-10.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    private var images: [UIImage]!;
    private var winSoundID: SystemSoundID = 0;
    private var crunchSoundID: SystemSoundID = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        images = [
                UIImage(named:"seven")!, UIImage(named:"bar")!,
                UIImage(named:"crown")!, UIImage(named:"cherry")!,
                UIImage(named:"lemon")!, UIImage(named:"apple")!,
        ];
        winLabel.text = " ";
        arc4random_stir();
        
        
    }
    
    func showButton(){
        button.isHidden = false;
        
    }
    
    func playWinSound(){
        if (winSoundID == 0){
            let soundURL = Bundle.main.url(forResource: "win", withExtension: "wav")! as CFURL;
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID);
        }
        AudioServicesPlaySystemSound(winSoundID);
        winLabel.text = "WINNER!";
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.showButton();
        });
        
        
    }
    
    @IBAction func spin(_ sender: UIButton) {
        var win = false;
        var numInRow = -1;
        var lastVal = -1;
        for i in 0..<5{
            let newValue = Int(arc4random_uniform(UInt32(images.count)));
            if (newValue == lastVal){
                numInRow += 1;
                
            } else{
                numInRow = 1;
            }
            
            lastVal = newValue;
            picker.selectRow(newValue, inComponent: i, animated: true);
            picker.reloadComponent(i);
            
            if (numInRow >= 3){
                win = true;
            }
        }
        //winLabel.text = win ? "Winner!" : " ";
        if (winSoundID == 0){
            let soundURL = Bundle.main.url(forResource: "win", withExtension: "wav")! as CFURL;
            AudioServicesCreateSystemSoundID(soundURL, &crunchSoundID);
        }
        AudioServicesPlaySystemSound(crunchSoundID);
        
        if (win){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.playWinSound();
            });
            
        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.showButton();
            });
        }
        button.isHidden = true;
        winLabel.text = " ";
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Mark:-
    //Mark Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count;
    }
    
    //Mark:-
    //Mark Picker Data Delegate Methods
    func pickerView (_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row];
        let imageView = UIImageView(image: image);
        return imageView;
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent componet: Int) ->CGFloat {
        return 64;
    }
}
