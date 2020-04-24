//
//  SearchMovieTableViewCell.swift
//  MyMovies
//
//  Created by Hunter Oppel on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    var movie: MovieRepresentation? {
        didSet {
            movieTitleLabel.text = movie?.title
        }
    }
    
    @IBAction func addMovie(_ sender: UIButton) {
        guard let movie = movie else { return }
        
        Movie(movieRepresentation: movie)
        
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
    }
}