// Copyright 2021 Espressif Systems
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
//  MembersInfoTableViewCell.swift
//  ESPRainMaker
//

import UIKit

class MembersInfoTableViewCell: UITableViewCell {
    @IBOutlet var secondaryUserLabel: UILabel!
    @IBOutlet var removeMemberButton: UIButton!
    @IBOutlet var timeStampLabel: UILabel!

    // Closure that contains block of code executed on the action of Remove Member button
    var removeButtonAction: () -> Void = {}

    override func awakeFromNib() {
        super.awakeFromNib()
        // UI Customisation
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // Removes sharing of node for a secondary member
    @IBAction func deleteButtonTapped(_: Any) {
        removeButtonAction()
    }
}
