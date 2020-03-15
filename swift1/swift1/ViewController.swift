//
//  ViewController.swift
//  swift1
//
//  Created by w0427115 on 2020-01-29.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statusLabel.text = "";
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        var title = sender.title(for: .selected)!;
        
        let text = "\(title) button pressed";
        
        let styledText = NSMutableAttributedString(string: text);
        let font = UIFont.systemFont(ofSize: statusLabel.font.pointSize);
        let attributes = [NSAttributedString.Key.font: font];
        
        let nameRange = (text as NSString).range(of: title);
        styledText.setAttributes(attributes, range: nameRange);
        statusLabel.attributedText = styledText;
    }
}

