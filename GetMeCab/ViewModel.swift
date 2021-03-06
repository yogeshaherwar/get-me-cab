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
    var errorMessage: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    let bag = DisposeBag()
    
    init(useCase: UseCaseType) {
        self.useCase = useCase
    }
    
    func getCabList() {
        guard let url = URL(string: "http://www.mocky.io/v2/5dc3f2c13000003c003477a0") else { return }
        useCase.getVehicleList(url: url).subscribe { event in
            switch event {
            case .success(let response):
                self.vehicleList.accept(response)
                
            case .error(let error):
                self.errorMessage.accept(error.localizedDescription)
            }
        }.disposed(by: bag)
    }
}
