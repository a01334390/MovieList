//
//  MovieFeedController.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import Foundation
import Keys

enum LoadStatus {
    case ready (nextPage: Int)
    case loading (page: Int)
    case parseError
    case done
}

class MovieFeed : ObservableObject, RandomAccessCollection {
    typealias Result = Movie
    @Published var movieListItems = [Movie]()
    
    var startIndex: Int { movieListItems.startIndex }
    var endIndex: Int { movieListItems.endIndex }
    var loadStatus = LoadStatus.ready(nextPage: 1)
    
    var baseURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(MovieListKeys().movieAPIKey)&language=en-US&page="
    
    init(){
        loadMoreMovies()
    }
    
    subscript(position: Int) -> Movie {
        return movieListItems[position]
    }
    
    /**
     Loads Movies from URL
     - Parameter currentItem: Receives the currentItem that is displayed to determine if it should load more Movies
     */
    func loadMoreMovies(currentItem: Movie? = nil) {
        // Check if data should or shouldn't be loaded
        if !shouldLoadMoreData(currentItem: currentItem) {
            return
        }
        
        // Check if the page we need to load is ready to be loaded
        guard case let .ready(page) = loadStatus else {
            return
        }
        // Start downloading using URLSession
        loadStatus = .loading(page: page)
        let completeURL = "\(baseURL)\(page)"
        let url = URL(string: completeURL)!
        let task = URLSession.shared.dataTask(with: url,completionHandler: parseMoviesFromResponse(data:response:error:))
        task.resume()
    }
    
    /**
     Determines if more Movies are needed to be downloaded
     - Parameter currentItem: Receives the currentItem that is displayed to determine if it should load more Movies
     - Returns: True if more Movies should be loaded or false otherwise
     */
    func shouldLoadMoreData(currentItem : Movie? = nil) -> Bool{
        guard let currentItem = currentItem else {
            return true
        }
        
        // If the current Movie retrieved is within 4 of the last element of the page, we should load more
        for n in (movieListItems.count - 4)...(movieListItems.count - 1) {
            if n >= 0 && currentItem.id == movieListItems[n].id {
                return true
            }
        }
        return false
    }
    
    /**
     Parses the response from Movie API to the required structure
     - Parameters:
     - data: Response data from the URLRequest Closure
     - response: URLResponse object to check for any data we should find useful
     - error: Error object to retrieve possible mistakes
     */
    func parseMoviesFromResponse(data: Data?, response : URLResponse?, error : Error?) {
        // Check if any error occurred and pass the status as a bad state
        guard error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error produced")")
            loadStatus = .parseError
            return
        }
        // Check if data is present, else, pass it as a bad state
        guard let data = data else {
            print("Error: \(error?.localizedDescription ?? "Unknown error produced")")
            loadStatus = .parseError
            return
        }
        
        // Parse Data into an array of characters
        let apiCharacters = parseMoviesFromData(data: data)
        
        // Pass characters through main.async to display them on the List
        DispatchQueue.main.async {
            // Pass all new characters to the list
            self.movieListItems.append(contentsOf: apiCharacters)
            // If no more characters are available, we're done
            if apiCharacters.count == 0 {
                self.loadStatus = .done
            } else {
                // If we passed all characters and we still HAVE some, something weird is happening
                guard case let .loading(page) = self.loadStatus else {
                    fatalError("Load status is in a bad state")
                }
                // If everything is done, we can load the next page
                self.loadStatus = .ready(nextPage: page + 1)
            }
        }
    }
    
    /**
     Parses the Data from Rick and Morty's request to an array of characters
     - Parameters:
     - data: Response data from the URLRequest Closure
     - Returns: Array of APICharacters
     */
    func parseMoviesFromData(data: Data) -> [Movie] {
        var response : APIMovieResponse
        do {
            response = try JSONDecoder().decode(APIMovieResponse.self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
        
        return response.movies ?? []
    }
    
}
