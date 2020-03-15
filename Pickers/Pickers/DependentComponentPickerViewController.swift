//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by w0427115 on 2020-02-10.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dependentPicker: UIPickerView!
    
    private let stateComponent = 0;
    private let zipComponent = 1;
    
    private var states: [String]!;
    private var zips: [String]!;
    private var stateZips: [String:[String]]!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bundle = Bundle.main;
        let plistURL = bundle.url(forResource: "statedictionary", withExtension: "plist");
        stateZips = NSDictionary.init(contentsOf: (plistURL)!) as? [String:[String]];
        
        let allStates = stateZips.keys;
        states = allStates.sorted();
        
        let selectedState = states[0];
        zips = stateZips[selectedState];
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let stateRow = dependentPicker.selectedRow(inComponent: stateComponent);
        let zipRow = dependentPicker.selectedRow(inComponent: zipComponent);
        
        let state = states[stateRow];
        let zip = zips[zipRow];
        
        let title = "Thank you for your choice";
        let message = "\(zip) is in \(state)";
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil);
        alert.addAction(action);
        present(alert, animated: true, completion: nil)
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
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == stateComponent){
            return states.count;
        }else {
            return zips.count;
        }
    }
    
    //Mark:-
    //Mark Picker Data delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == stateComponent){
            return states[row];
        }else {
            return zips[row];
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if (component == stateComponent){
            let selectedState = states[row];
            zips = stateZips[selectedState];
            
            dependentPicker.reloadComponent(zipComponent);
            dependentPicker.selectRow(0, inComponent: zipComponent
                , animated: true);
        }
    }

}
