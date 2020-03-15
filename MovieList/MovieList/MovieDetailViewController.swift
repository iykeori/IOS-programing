//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by w0427115 on 2020-03-02.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imgMovie: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var selectedMovieImage: UIImage!;
    var selectedMovieTitle: String!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgMovie.image = selectedMovieImage;
        lblTitle.text = selectedMovieTitle;
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
