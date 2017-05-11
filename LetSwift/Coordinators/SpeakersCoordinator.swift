//
//  SpeakersCoordinator.swift
//  LetSwift
//
//  Created by Kinga Wilczek on 21.04.2017.
//  Copyright © 2017 Droids On Roids. All rights reserved.
//

import UIKit

final class SpeakersCoordinator: Coordinator, Startable {
    
    func start() {
        let controller = SpeakersViewController()
        navigationViewController.viewControllers = [controller]
    }
}