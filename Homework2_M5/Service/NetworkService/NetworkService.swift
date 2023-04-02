//
//  NetworkService.swift
//  Homework2_M5
//
//  Created by Aziza A on 25/3/23.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    private let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php")!
    
    func fetchCocktails() async throws -> Drinks {
        var cocktails = Drinks(drinks: [])
        for value in UnicodeScalar("a").value...UnicodeScalar("z").value {
            guard let unicodeLetter = UnicodeScalar(value),
                  case let letter = String(unicodeLetter) else {
                fatalError("This unicod scalar is not valid")
            }
            
            let drinks = try await fetchDataByLetter(letter)
            cocktails.drinks?.append(contentsOf: drinks.drinks ?? [])
        }
        return cocktails
    }
    
    private func fetchDataByLetter(_ char: String) async throws -> Drinks {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.thecocktaildb.com"
        urlComponents.path = "/api/json/v1/1/search.php"
        urlComponents.queryItems = [.init(name: "f", value: char)]
        
        guard let url = urlComponents.url else {
            fatalError("URL NOT CORRECT")
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        return try decodeData(data)
    }
    
    func searchCocktails(_ word: String) async throws -> Drinks {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.thecocktaildb.com"
        urlComponents.path = "/api/json/v1/1/search.php"
        urlComponents.queryItems = [.init(name: "s", value: word)]

        guard let url = urlComponents.url else {
            fatalError("URL NOT CORRECT")
        }

        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))

        return try decodeData(data)
    }
    
    private func decodeData<T: Decodable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
