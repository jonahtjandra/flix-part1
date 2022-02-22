//
//  MovieService.swift
//  Flix
//
//  Created by Jonah Tjandra on 2/19/22.
//

import Foundation
import Alamofire
import AlamofireImage

class MovieService {
    //singleton class
    static let shared = MovieService();
    
    func fetchMovies(completion: @escaping (([Movie]) -> Void)) {
        var movies: [Movie] = []
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                        print(dataDict)
                        if let movieResults = dataDict["results"] as? [AnyObject] {
//                            print(movieResults)
                            for movieResult in movieResults {
                                let posterImage = "https://www.themoviedb.org/t/p/w500\(movieResult["poster_path"]!!)"
                                let backdropImage = "https://www.themoviedb.org/t/p/w500\(movieResult["backdrop_path"]!!)"
                                let movie = Movie(Title : movieResult["original_title"] as! String, Description: movieResult["overview"] as! String, PosterImageUrl: posterImage, BackdropImageUrl: backdropImage, Date: movieResult["release_date"] as! String)
                                movies.append(movie)
                            }
                            completion(movies)
                        }
                    }
                case let .failure(error):
                    print(error)
                }
            }
    }
    
}
