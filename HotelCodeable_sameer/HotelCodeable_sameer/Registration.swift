//
//  Registration.swift
//  HotelCodeable_sameer
//
//  Created by Sameer Verma on 06/05/24.
//

import Foundation
struct Registration{
    var firstName : String
    var lastName : String
    var emailAddress  : String
    
    var checkInDate : Date
    var checkOutDate : Date
    
    var numberOfAdult : Int
    var numberOfChild :  Int
    
    var wifi : Bool
    var roomType : RoomType
}
