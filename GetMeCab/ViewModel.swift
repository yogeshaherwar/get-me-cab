//
//  ViewModel.swift
//  GetMeCab
//
//  Created by Yogesh on 03/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    var useCase: UseCaseType!
    let vehicleList: BehaviorRelay<[VehicleListResponse]> = BehaviorRelay(value: [])
    let bag = DisposeBag()
    
    init(useCase: UseCaseType) {
        self.useCase = useCase
    }
    
    func getCabList() {
        useCase.getVehicleList().subscribe { event in
            switch event {
            case .success(let response):
                self.vehicleList.accept(response)
                
            case .error(let error):
                print(error.localizedDescription)
            }
        }.disposed(by: bag)
    }
}
