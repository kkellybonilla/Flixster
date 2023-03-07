//
//  MovieCell.swift
//  project2-FlixsterPt1
//
//  Created by Kelly Bonilla Guzmán on 3/6/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    // Configures the cell's UI for the given movie.
    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.overview
        
        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: movie.posterImage, into: movieImageView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
