//
//  NetworkingService.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 21/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingService {
    
    private let baseUrl = "https://api.openweathermap.org"
    
    public func sendRequest(for city: String) {
        //let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appId=8b32f5f2dc7dbd5254ac73d984baf306")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appId", value: "8b32f5f2dc7dbd5254ac73d984baf306")
        ]
        
        guard let url = urlComponents.url else { fatalError("URL is badly formatted.") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) 
            print(json ?? "")
        }
        
        task.resume()
    }
    
    static let session: SessionManager = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60
        let session = SessionManager(configuration: config)
        return session
    }()
    
    public func sendAlamofireRequest(city: String) {
        let path = "/data/2.5/forecast"
        
        let params: Parameters = [
            "q": city,
            "units": "metric",
            "appId": "8b32f5f2dc7dbd5254ac73d984baf306"
        ]
        
//        let session = SessionManager()
        NetworkingService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            response in
            guard let json = response.value else { return }
            
            print(json)
        }
        
        print("end")
    }
    
    func loadGroups(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.95"
        ]
        
        NetworkingService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    func loadFriends(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.95",
            "fields": "nickname"
        ]
        
        NetworkingService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    func loadPhotos(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.95"
        ]
        
        NetworkingService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    //MARK:
    func loadSearchGroups(token:String, q: String){
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.search"
        let params: Parameters = [
            "access_token" : token,
            "q" : q,
            "v":"5.95"]
        
        NetworkingService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
}
