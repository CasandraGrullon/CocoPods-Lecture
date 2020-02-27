//
//  APIClient.swift
//  CocoPods-Lecture
//
//  Created by casandra grullon on 2/27/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation
import Alamofire // just like importing NetworkHelper

struct APIClient {
  
    static func fetchCocktail(completion: @escaping (AFResult<Cocktail>) -> () ) {
    let endpointURLString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    
    // we need a URL
    guard let url = URL(string: endpointURLString) else {
      return
    }
    
    AF.request(url).response { (response) in
        //response.data
        //response.error
        //response.request
        
        if let error = response.error {
            completion(.failure(error))
        } else if let data = response.data {
            //make our cocktail model
            do {
                let results = try JSONDecoder().decode(DrinksWrapper.self, from: data)
                if let cocktail = results.drinks.first {
                    completion(.success(cocktail))
                }
            } catch {
                print("stupid af")
            }
        }
        
    }
  }
  
}
