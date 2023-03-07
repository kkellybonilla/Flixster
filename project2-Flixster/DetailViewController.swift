//
//  DetailViewController.swift
//  project2-FlixsterPt1
//
//  Created by Kelly Bonilla Guzmán on 3/6/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var movieDetailTitleLabel: UILabel!
    @IBOutlet weak var movieDetailDescriptionLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    // A property to store the movie object.
    // We can set this property by passing along the movie object associated with the movie the user tapped in the table view.
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the image located at the `backdropImageView` URL and set it on the image view.
        Nuke.loadImage(with: movie.backdropImage, into: backdropImageView)
        
        movieDetailTitleLabel.text = movie.title
        movieDetailDescriptionLabel.text = movie.overview
        voteAverageLabel.text = String(movie.voteAverage) + " Vote Average"
        voteCountLabel.text = String(movie.voteCount) + " Votes"
        popularityLabel.text = String(movie.popularity) + " Popularity"
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
