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
//  ESPNodeConnectedEvent.swift
//  ESPRainMaker
//

import Foundation

// Class associated with node connected event.
class ESPNodeConnectedEvent: ESPNotificationEvent {
    /// Modifies notification content to display message of devices online.
    ///
    /// - Returns: Modified notification object.
    override func modifiedContent() -> ESPNotifications? {
        var modifiedNotification = notification
//        modifiedNotification.body = "Some device(s) came online. Tap to view."
        modifiedNotification.body = "Algún Interruptor conectó a línea."
        // Gets node id from the event data.
        if let nodeId = eventData[ESPNotificationKeys.nodeIDKey] as? String {
            var body: String?
            // Mapped node id to device name associated with the node.
            if let nodeDeviceMapping = ESPLocalStorageNodes(ESPLocalStorageKeys.suiteName).getDeviceListDictionary(), let devices = nodeDeviceMapping[nodeId] {
                    // Customised message to make it more user friendly.
                    if devices.count > 1 {
                        body = "\(devices.joined(separator: ", ")) están ahora en línea."
                    } else {
                        body = "\(devices[0]) está ahora en línea."
                    }
                }
            if let bodyText = body {
                modifiedNotification.body = bodyText
            }
        }
        // Saves notification in local storage.
        notificationStore.storeESPNotification(notification: modifiedNotification)
        // Returns modified notification.
        return modifiedNotification
    }
}
