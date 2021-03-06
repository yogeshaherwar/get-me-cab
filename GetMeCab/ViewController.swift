//
//  ViewController.swift
//  GetMeCab
//
//  Created by Yogesh on 01/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//

import UIKit
import RxSwift
import GoogleMaps

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var vehicleTableView: UITableView!
    var viewModel: ViewModel!
    let cellIdentifier = "VehicleTableViewCell"
    let bag = DisposeBag()
    var markerList: [GMSMarker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCabList()
        setupUI()
        setupObservables()
    }
    
    func setupUI() {
        mapView.camera = GMSCameraPosition.camera(withLatitude: 20.5937, longitude: 78.9629, zoom: 6.0)
        vehicleTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupObservables() {
        viewModel.vehicleList.asObservable().observeOn(MainScheduler.instance).subscribe{ list in
            guard let list = list.element, !list.isEmpty else { return }
            for element in list {
                if let latitude = element.location?.latitude,
                    let longitude = element.location?.longitude {
                    let tempMarker = GMSMarker()
                    tempMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    tempMarker.icon = GMSMarker.markerImage(with: .red)
                    tempMarker.map = self.mapView
                    self.markerList.append(tempMarker)
                }
            }
            if let firstPosition = self.markerList.first?.position {
                self.mapView.animate(to: GMSCameraPosition(target: firstPosition, zoom: 10))
            }
        }.disposed(by: bag)
        
        viewModel.vehicleList.bind(to: vehicleTableView.rx.items(cellIdentifier: cellIdentifier, cellType: VehicleTableViewCell.self)) { (row, element, cell) in
            cell.setupData(data: element)
        }.disposed(by: bag)
        
        vehicleTableView.rx.itemSelected.subscribe(onNext: { [unowned self] indexPath in
            let element = self.viewModel.vehicleList.value[indexPath.row]
            guard let modelName = element.modelName,
            let vehicleName = element.vehicleDetails?.name,
                let licensePlate = element.licensePlate else { return }
            for marker in self.markerList {
                marker.icon = GMSMarker.markerImage(with: .red)
            }
            
            let cameraPosition = GMSCameraPosition(target: self.markerList[indexPath.row].position, zoom: 15.0)
            self.markerList[indexPath.row].icon = GMSMarker.markerImage(with: .blue)
            self.markerList[indexPath.row].title = modelName
            self.markerList[indexPath.row].snippet = vehicleName + "\n" + licensePlate
            self.mapView.animate(to: cameraPosition)
            self.mapView.selectedMarker = self.markerList[indexPath.row]
            
        }).disposed(by: bag)
    }
}

