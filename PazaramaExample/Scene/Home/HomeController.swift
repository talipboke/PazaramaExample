//
//  ViewController.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import UIKit

final class HomeController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

