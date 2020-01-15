//
//  NetworkService.swift
//  DonateUs
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import Foundation

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
typealias ErrorHandler = (String) -> Void
class NetworkLayer {
    static let genericError = "Something went wrong. Please try again later"
    func get<T: Decodable>(urlString: String,
                           headers: [String: String] = [:],
                           successHandler: @escaping (T) -> Void,
                           errorHandler: @escaping ErrorHandler) {
        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
                errorHandler(NetworkLayer.genericError)
                return
            }
            if self.isSuccessCode(urlResponse) {
                guard let data = data else {
                    print("Unable to parse the response in given type \(T.self)")
                    return errorHandler(NetworkLayer.genericError)
                }
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    successHandler(responseObject)
                    return
                }
            }
            errorHandler(NetworkLayer.genericError)
        }
        guard let url = URL(string: urlString) else {
            return errorHandler("Unable to create URL from given string")
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
    }
    func post<T: Encodable, V: Decodable>(urlString: String,
                        body: T,
                        headers: [String: String] = [:],
                        successHandler: @escaping (V) -> Void,
                        errorHandler: @escaping ErrorHandler) {
        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
                errorHandler(NetworkLayer.genericError)
                return
            }
            if self.isSuccessCode(urlResponse) {
                guard let data = data else {
                    print("Unable to parse the response in given type \(T.self)")
                    return errorHandler(NetworkLayer.genericError)
                }
                if let responseObject = try? JSONDecoder().decode(V.self, from: data) {
                    successHandler(responseObject)
                    return
                }
                return
            }
            errorHandler(NetworkLayer.genericError)
        }
        guard let url = URL(string: urlString) else {
            return errorHandler("Unable to create URL from given string")
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 90
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.allHTTPHeaderFields?["Content-Type"] = "application/json"
        guard let data = try? JSONEncoder().encode(body) else {
            return errorHandler("Cannot encode given object into Data")
        }
        request.httpBody = data
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
    }
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else { return false }
        return isSuccessCode(urlResponse.statusCode)
    }
    func loadImageData(imageUrl: String, successHandler: @escaping(Data) -> Void, errorHandler: @escaping(String) -> Void) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, error)  in
            if let err = error {
                debugPrint("Error in Fetching Image Data", err)
                errorHandler(err.localizedDescription)
                return
            }
            guard let imageData = data else {
                errorHandler(NetworkLayer.genericError)
                return
            }
            DispatchQueue.main.async {
                successHandler(imageData)
            }
        }.resume()
    }
}
