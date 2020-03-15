//
//  Tab2ViewController.swift
//  MovieList
//
//  Created by w0427115 on 2020-03-02.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class Tab2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies = [] as NSArray;
    var selectedCellIndex: Int = 0;
    
    @IBOutlet weak var movieTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        
        //set the movie in the imageView within the cell
        let image = cell.viewWithTag(1) as! UIImageView;
        image.image = UIImage(named: "\(indexPath.row).jpg");
        
        let title = cell.viewWithTag(2) as! UILabel;
        title.text = movies.object(at: indexPath.row) as? String;
        
        
        return cell;
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTableView.dataSource = self;
        movieTableView.delegate = self;
        
        movies = ["Chasing Amy", "Mallrats", "Dogma", "Clerks", "Jay & Slient Bob Strike Back", "Red State", "Cop Out", "Jersey Girl"];
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get selected index
        selectedCellIndex = indexPath.row;
        //manually trigger sqgue /transition
        self.performSegue(withIdentifier: "segueShowSelectedMovie", sender: nil);
        
        
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        if (segue.identifier == "segueShowSelectedMovie"){
            
            let vc = segue.destination as! MovieDetailViewController;
            vc.selectedMovieImage = UIImage(named: "\(selectedCellIndex).jpg");
            vc.selectedMovieTitle = movies.object(at:selectedCellIndex) as? String;
            
            
        }
        
    }

}
