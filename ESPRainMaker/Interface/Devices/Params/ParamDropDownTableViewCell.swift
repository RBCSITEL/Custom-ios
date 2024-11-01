// Copyright 2020 Espressif Systems
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  ParamDropDownTableViewCell.swift
//  ESPRainMaker
//

import DropDown
import UIKit

class ParamDropDownTableViewCell: DropDownTableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        // Customise dropdown element for param screen
        // Hide row selection button
        checkButton.isHidden = true
        leadingSpaceConstraint.constant = 15.0
        trailingSpaceConstraint.constant = 15.0

        backgroundColor = UIColor.clear
        backView.layer.borderWidth = 1
        backView.layer.cornerRadius = 10
        backView.layer.borderColor = UIColor.clear.cgColor
        backView.layer.masksToBounds = true

        layer.shadowOpacity = 0.18
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false
    }

    @IBAction override func dropDownButtonTapped(_: Any) {
        // Configuring dropdown attributes
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().selectionBackgroundColor = #colorLiteral(red: 0.04705882353, green: 0.4392156863, blue: 0.9098039216, alpha: 1)
        let dropDown = DropDown()
        dropDown.dataSource = datasource
        dropDown.width = UIScreen.main.bounds.size.width - 100
        dropDown.anchorView = self
        dropDown.show()
        // Selecting param value in dropdown list
        if let index = datasource.firstIndex(where: { $0 == currentValue }) {
            dropDown.selectRow(at: index)
        }
        // Assigning action for dropdown item selection
        dropDown.selectionAction = { [unowned self] (_: Int, item: String) in
            if self.param.dataType?.lowercased() == "string" {
                DeviceControlHelper.shared.updateParam(nodeID: self.device.node?.node_id, parameter: [self.device.name ?? "": [self.param.name ?? "": item]], delegate: paramDelegate)
                param.value = item
            } else {
                DeviceControlHelper.shared.updateParam(nodeID: self.device.node?.node_id, parameter: [self.device.name ?? "": [self.param.name ?? "": Int(item)]], delegate: paramDelegate)
                param.value = Int(item)
            }
            currentValue = item
            DispatchQueue.main.async {
                controlValueLabel.text = item
            }
        }
    }
}
