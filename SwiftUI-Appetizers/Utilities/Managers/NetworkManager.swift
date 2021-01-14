//
//  NetworkManager.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 12/1/21.
//

import UIKit

final class NetworkManager {
    
    /// singleton
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            
            /// checks for any kind of error; usually no internet
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            /// checks that the HTTP response is valid and is a 200 type; that could be broken out in more detail if needed
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            /// checks that the data makes sense
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            /// decodes the JSON; if it fails, the data sucks.
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        /// if the image is in the cache
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            return
        }
        
        task.resume()
    }
}
