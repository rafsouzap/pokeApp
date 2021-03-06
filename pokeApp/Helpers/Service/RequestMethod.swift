//
//  RequestMethod.swift
//  pokeApp
//
//  Created by Rafael de Paula on 11/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

enum RequestMethod {
    case get
    case post
    case put
    case delete
    
    var value: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}
