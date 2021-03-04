//
//  VehicleList.swift
//  GetMeCab
//
//  Created by Yogesh on 03/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//
/*
"id": "WMWOLAID00001",
"modelIdentifier": "mini",
"modelName": "MINI",
"group": "MINI",
"licensePlate": "KA01AZ4711",
"innerCleanliness": "REGULAR",
"carImageUrl": "https://i.imgur.com/UqzFXjd.png",
"vehicleDetails": {
  "name": "Vanessa",
  "make": "BMW",
  "color": "midnight_black",
  "series": "REGULAR",
  "fuel_type": "D",
  "fuel_level": 0.4,
  "transmission": "A"
},
"location": {
  "latitude": 12.950415,
  "longitude": 77.642605
}
*/
import Foundation
import ObjectMapper

public struct VehicleListResponse {
    public let id: String?
    public let modelIdentifier: String?
    public let modelName: String?
    public let group: String?
    public let licensePlate: String?
    public let innerCleanliness: String?
    public let carImageUrl: String?
    public let vehicleDetails: VehicleDetails?
    public let location: Location?
}

extension VehicleListResponse: ImmutableMappable {
    public init(map: Map) throws {
        self.id = try? map.value("id")
        self.modelIdentifier = try? map.value("modelIdentifier")
        self.modelName = try? map.value("modelName")
        self.group = try? map.value("group")
        self.licensePlate = try? map.value("licensePlate")
        self.innerCleanliness = try? map.value("innerCleanliness")
        self.carImageUrl = try? map.value("carImageUrl")
        self.vehicleDetails = try? map.value("vehicleDetails")
        self.location = try? map.value("location")
    }
}

public struct VehicleDetails {
    public let name: String?
    public let make: String?
    public let color: String?
    public let series: String?
    public let fuelType: String?
    public let fuelLevel: Double?
    public let transmission: String?
}

extension VehicleDetails: ImmutableMappable {
    public init(map: Map) throws {
        self.name = try? map.value("name")
        self.make = try? map.value("make")
        self.color = try? map.value("color")
        self.series = try? map.value("series")
        self.fuelType = try? map.value("fuel_type")
        self.fuelLevel = try? map.value("fuel_level")
        self.transmission = try? map.value("transmission")
    }
}

public struct Location {
    public let latitude: Double?
    public let longitude: Double?
}

extension Location: ImmutableMappable {
    public init(map: Map) throws {
        self.latitude = try? map.value("latitude")
        self.longitude = try? map.value("longitude")
    }
}
