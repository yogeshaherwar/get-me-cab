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
    func getVehicleList(url: URL) -> Single<[VehicleListResponse]>
}

public class UseCase: UseCaseType {
    
    public func getVehicleList(url: URL) -> Single<[VehicleListResponse]> {
        let urlRequest = URLRequest(url: url)
        return request(urlRequest)
    }
    
    func request<Response: ImmutableMappable>(_ urlRequest: URLRequest) -> Single<[Response]> {
        
        return Single<[Response]>.create { single in
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                
                if let error = error {
                    single(.error(error))
                    return
                }
                
                guard let data = data else {
                    single(.error(DataError.emptyResponse))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    let result = try Mapper<Response>().mapArray(JSONObject: json)
                    single(.success(result))
                } catch {
                    single(.error(DataError.failedToMapObject))
                }
            })
            task.resume()
            return Disposables.create()
        }
    }
}

public enum DataError : Error {
    case failedToMapObject
    case emptyResponse
}


