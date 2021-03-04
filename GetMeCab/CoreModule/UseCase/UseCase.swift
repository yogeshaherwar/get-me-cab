//
//  UseCase.swift
//  GetMeCab
//
//  Created by Yogesh on 01/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

public protocol UseCaseType: class {
    func getVehicleList() -> Single<[VehicleListResponse]>
}

public class UseCase: UseCaseType {
    
    public func getVehicleList() -> Single<[VehicleListResponse]> {
        let urlRequest = URLRequest(url: URL(string: "http://www.mocky.io/v2/5dc3f2c13000003c003477a0")!)
        
        return Single<[VehicleListResponse]>.create { single in
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                
                if let error = error {
                    single(.error(error))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!)
                    let result = try Mapper<VehicleListResponse>().mapArray(JSONObject: json)
                    single(.success(result))
                } catch {
                    single(.error(error))
                }
            })
            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
