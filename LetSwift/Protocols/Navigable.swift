//
//  Navigable.swift
//  LetSwift
//
//  Created by Kinga Wilczek on 31.07.2017.
//  Copyright © 2017 Droids On Roids. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit

protocol Navigable: class {
    var asViewController: UIViewController { get }
    var controllers: [UIViewController] { get set }

    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    @discardableResult func popViewController(animated: Bool) -> UIViewController?
}

extension Navigable where Self: UIViewController {
    var asViewController: UIViewController {
        return self
    }
}

extension UINavigationController: Navigable {
    var controllers: [UIViewController] {
        get { return viewControllers }
        set { viewControllers = newValue }
    }
}

extension UITabBarController: Navigable {
    var controllers: [UIViewController] {
        get { return viewControllers ?? [] }
        set { viewControllers = newValue }
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        (selectedViewController as? UINavigationController)?.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool) -> UIViewController? {
        return (selectedViewController as? UINavigationController)?.popViewController(animated: animated)
    }
}
