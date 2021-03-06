//
//  VehicleTableViewCell.swift
//  GetMeCab
//
//  Created by Yogesh on 04/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//

import UIKit
import Kingfisher

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var vehicleModelName: UILabel!
    @IBOutlet weak var vehicleNameLabel: UILabel!
    @IBOutlet weak var vehicleAdditionalInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(data: VehicleListResponse) {
        if let imageURL = data.carImageUrl {
            vehicleImageView.kf.setImage(with: URL(string: imageURL))
        }
        if let modelName = data.modelName,
            let make = data.vehicleDetails?.make,
            let vehicleName = data.vehicleDetails?.name,
            let fuelLevel = data.vehicleDetails?.fuelLevel,
            let fuelType = data.vehicleDetails?.fuelType,
            let transmissionType = data.vehicleDetails?.transmission {
            let fuel = Int(round(fuelLevel * 100))
            vehicleModelName.text = modelName
            vehicleNameLabel.text = vehicleName + "(\(make))" + ", " + getFuelName(fuelType: fuelType) + ", " + getTransmissionName(transmissionType: transmissionType)
            vehicleAdditionalInfoLabel.text = "Fuel level \(fuel)%"
        }
    }
    
    func getFuelName(fuelType: String) -> String {
        switch fuelType {
        case "P":
            return "Petrol"
        case "D":
            return "Diesel"
        default:
            return fuelType
        }
    }
    
    func getTransmissionName(transmissionType: String) -> String {
        switch transmissionType {
        case "A":
            return "Automatic"
        case "M":
            return "Manual"
        default:
            return transmissionType
        }
    }
}
