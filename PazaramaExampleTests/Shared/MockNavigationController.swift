//
//  MockNavigationController.swift
//  PazaramaExampleTests
//
//  Created by Talip on 26.06.2023.
//

import UIKit

final class MockNavigationController: UINavigationController {

    override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: false)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        return super.popToRootViewController(animated: false)
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        return super.present(viewControllerToPresent, animated: false, completion: completion)
    }
}

