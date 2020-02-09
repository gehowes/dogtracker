//
//  foodtrackerappTests.swift
//  foodtrackerappTests
//
//  Created by Gwendolyn Howes on 08/02/2020.
//  Copyright © 2020 Gwendolyn Howes. All rights reserved.
//

import XCTest
@testable import Dog_Tracker

class foodtrackerappTests: XCTestCase {

//MARK: Dog Class Tests
    
    // Comfirm that the Dog initializer returns a Dog object when passed valid parameters.
    func testDogInitializationSucceeds() {
        
        // Zero rating
        let zeroRatingDog = Dog.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingDog)
        
        // Highest positive rating
        let positiveRatingDog = Dog.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingDog)
    }
    
    // Comfirm that the Dog initializer returns nil when passed a negative rating or an empty name.
    func testDogInitializationFails() {
        
        // Negative rating
       let negativeRatingDog = Dog.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingDog)
        
        // Rating exceeds maximum
       let largeRatingDog = Dog.init(name: "Large", photo: nil, rating: 6)
       XCTAssertNil(largeRatingDog)
        
        //Empty String
       let emptyStringDog = Dog.init(name: "", photo: nil, rating: 0)
       XCTAssertNil(emptyStringDog)
    }

}
