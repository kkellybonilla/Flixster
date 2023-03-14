//
//  PostersViewController.swift
//  project2-Flixster
//
//  Created by Kelly Bonilla Guzmán on 3/8/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a search URL for fetching posters
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=bdd3255d15a527c8920a46fae70b90fe")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(MoviesResponse.self, from: data)
                let movies = response.results
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }
                
                print(movies)
                
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        
        collectionView.dataSource = self
        
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 0

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 0

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each item/cell should display at
        layout.itemSize = CGSize(width: width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // the number of items shown should be the number of posters we have.
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
            let movie = movies[indexPath.item]

            // Get the artwork image url
            let imageUrl = URL(string: "https://www.themoviedb.org/t/p/w1280" + movie.posterPath)

            // Set the image on the image view of the cell
            Nuke.loadImage(with: imageUrl!, into: cell.posterImageView)

            return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the collection view
            let indexPath = collectionView.indexPath(for: cell),
            // Get the detail view controller
            let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated movie
            let movie = movies[indexPath.item]
            
            // Set the movie on the detail view controller
            detailViewController.movie = movie
        }
    }
    
}
