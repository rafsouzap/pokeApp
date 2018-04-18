//
//  PokemonService.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class PokemonService {
    
    fileprivate static let kOffsetParameter = "offset"
    fileprivate static let kLimitParameter = "limit"
    
    func getPokemons(limit: Int = 20, offSet: Int = 0, success: @escaping ([Pokemon]) -> Void, failure: @escaping (_ error: ServiceError) -> Void) {
        
        let serviceUrl = AppEnvironment.baseServerAPI.value.appending("pokemon")
        
        let parameters = [PokemonService.kLimitParameter: limit,
                          PokemonService.kOffsetParameter: offSet] as [String : Any]

        ServiceManager.shared.request(url: serviceUrl, method: .get, queryParameters: parameters, success: { result in
            let response = try! JSONDecoder().decode(PokemoonRoot.self, from: result)
            success(response.results)
        }, failure: { fail in
            failure(ServiceError(code: fail.code))
        })
    }
    
    func getPokemonDetail(with name: String, success: @escaping (PokemonDetail) -> Void, failure: @escaping (_ error: ServiceError) -> Void) {
        
        let serviceUrl = AppEnvironment.baseServerAPI.value.appending("pokemon/\(name)")
        
        ServiceManager.shared.request(url: serviceUrl, method: .get, success: { result in
            let response = try! JSONDecoder().decode(PokemonDetail.self, from: result)
            success(response)
        }, failure: { fail in
            failure(ServiceError(code: fail.code))
        })
    }
}
