//
//  OnBoardingViewController.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 04/11/2022.
//

import UIKit
// I can not give api for country and category so I make this page with any data

class OnBoardingViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    // MARK: - Variables
    let countryArray = ["Egypt", "KSA", "UK"]
    let categoryArray = ["Football", "Arts", "Education"]
    private let countryPicker = DataPicker()
    private let categoryPicker = DataPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
    }
    // MARK: - Functions
    func setupPickers() {
        countryPicker.autoText = true
        countryPicker.initPickerView(arrString: countryArray ,txtFileld: countryTextField, view: view.self) { [weak self] index in
            }
        categoryPicker.autoText = true
        categoryPicker.initPickerView(arrString: categoryArray ,txtFileld: categoryTextField, view: view.self) { [weak self] index in
        }
    }
    @IBAction func saveAction(_ sender: Any) {
        let view = NewsConfigrator.newsView()
        view.navigationController?.pushViewController(view, animated: true)

    }
}
