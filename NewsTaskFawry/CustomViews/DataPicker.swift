//
//  DataPicker.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 04/11/2022.
//

import UIKit


class DataPicker: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    static var shared = DataPicker()
    var arr = [String]() {
        didSet {
            if !arr.isEmpty {
                isEmptyData = false
            } else {
                arr = [NSLocalizedString("No Data Found", comment: "")]
                isEmptyData = true
            }
        }
    }
    var autoText = false
    private var txtFiled: UITextField!
    static let instance = DataPicker()
    private var selectedIndex: Int?
    private var view: UIView!
    private var isEmptyData = true
    private var completion: ((Int?) -> Void)?
    private var picker = UIPickerView()
    func initPickerView(arrString: [String] = [], txtFileld: UITextField, view: UIView, complition: ((Int?) -> Void)?) {
        self.txtFiled = txtFileld
        self.view = view
        self.arr = arrString
        self.delegate = self
        txtFileld.inputView = self
        createToolbar()

        if  arrString.isEmpty {
            isEmptyData = true
        } else {
            isEmptyData = false
        }
        complition?(nil)
        txtFileld.text = nil
        self.completion = complition
    }

    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: NSLocalizedString("Done", comment: ""),
            style: .plain,
            target: self,
            action: #selector(dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(
            title: NSLocalizedString("Cancel", comment: ""),
            style: .plain,
            target: self,
            action: #selector(cancelPressed))
        toolBar.setItems([cancelBarButton, flexibleSpace, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtFiled.inputAccessoryView = toolBar
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
        if isEmptyData {
            completion?(nil)
        } else {
            completion?(selectedIndex ?? 0)
            if autoText {
                txtFiled.text = arr[selectedIndex ?? 0]
            }
        }
    }
    @objc func cancelPressed() {
        view.endEditing(true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard !arr.isEmpty   else {
            view.endEditing(true)
            return nil}
        return arr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard !arr.isEmpty else { return }
        if !isEmptyData {
            selectedIndex = row
        }
    }
}
