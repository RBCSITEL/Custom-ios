// Copyright 2022 Espressif Systems
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
//  AutomationEventTableViewCell.swift
//  ESPRainMaker
//

import UIKit

protocol AutomationEventCellDelegate {
    func changeEventButtonPressed()
}

class AutomationEventTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "automationEventTVC"
    
    var dataType: String?

    @IBOutlet weak var eventDeviceImageView: UIImageView!
    @IBOutlet weak var eventDeviceLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    
    var delegate: AutomationEventCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func changeEventPressed(_ sender: Any) {
        delegate?.changeEventButtonPressed()
    }
}
