//
//  movieTableCell.swift
//  Flix
//
//  Created by Jonah Tjandra on 2/19/22.
//

import UIKit

class movieTableCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    
    func configure(with movie: Movie) {
        movieTitle.text = movie.Title
        movieTitle.numberOfLines = 0
        movieImage.af.setImage(withURL: URL(string: movie.PosterImageUrl)!)
        movieDescription.text = movie.Description
        movieDescription.numberOfLines = 0
        movieDescription.sizeToFit()
    }
    
    
}
