//
//  NetworkManager.swift
//  Hero Randomizer
//
//  Created by Дархан Есенкул on 05.12.2022.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate{
    func onUpdateHero(with model: HeroModelResponse)
}

struct NetworkManager{
    
    var delegate: NetworkManagerDelegate?
    
    func getHero(by id: Int){
        let urlString = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/id/\(id).json"
        AF.request(urlString).responseDecodable(of: HeroModelResponse.self) { response in
            switch response.result{
            case.success(let heroModel):
                delegate?.onUpdateHero(with: heroModel)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
