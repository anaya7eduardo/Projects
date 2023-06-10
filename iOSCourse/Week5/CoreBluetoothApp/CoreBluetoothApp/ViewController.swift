//
//  ViewController.swift
//  CoreBluetoothApp
//
//  Created by Eduardo Anaya on 12/23/21.
//

//
//  BluetoothViewController.swift
//  CoreBluetoothApp
//
//  Created by Eduardo Anaya on 12/23/21.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    private var centralManager: CBCentralManager!
    var discoveredPeripherals = [CBPeripheral]()
    var connectedPeripheral: CBPeripheral?

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)

    }
    
    func startScan() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func connect(peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }

    func disconnect(peripheral: CBPeripheral) {
        centralManager.cancelPeripheralConnection(peripheral)
    }

    func discoverServices(peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }

    func discoverCharacteristics(peripheral: CBPeripheral) {
        guard let services = peripheral.services else { return }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }

    func discoverDescriptors(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        peripheral.discoverDescriptors(for: characteristic)
    }

    func subscribeToNotifications(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        peripheral.setNotifyValue(true, for: characteristic)
    }

    func readValue(characteristic: CBCharacteristic) {
        self.connectedPeripheral?.readValue(for: characteristic)
    }

//    func write(value: Data, characteristic: CBCharacteristic) {
//        self.connectedPeripheral?.writeValue(value, for: characteristic, type: .withResponse)
//        // OR
//        self.connectedPeripheral?.writeValue(value, for: characteristic, type: .withoutResponse)
//     }

    func write(value: Data, characteristic: CBCharacteristic) {
        //if let _ = connectedPeripheral?.canSendWriteWithoutResponse {
        if ((connectedPeripheral?.canSendWriteWithoutResponse) != nil) {
            self.connectedPeripheral?.writeValue(value, for: characteristic, type: .withoutResponse)
        }
    }

}

extension ViewController: CBCentralManagerDelegate {
 
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .poweredOn:
                startScan()
                print("Scanning")
            case .poweredOff:
                // Alert user to turn on Bluetooth
                print("Please Turn On Bluetooth")
            case .resetting:
                // Wait for next state update and consider logging interruption of Bluetooth service
                print("Please Wait, Resetting")
            case .unauthorized:
                // Alert user to enable Bluetooth permission in app Settings
                print("Please Enable Bluetooth Permissions")
            case .unsupported:
                // Alert user their device does not support Bluetooth and app will not work as expected
                print("Device Unsupported, App Will Not Work As Expected")
            case .unknown:
               // Wait for next state update
                print("Please Wait...")
//        @unknown default:
//            //fatalError()
//                print("ERROR 404 FATAL ERROR")
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                    didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                                 rssi RSSI: NSNumber) {
        self.discoveredPeripherals.append(peripheral)
    }

//    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//        self.connectedPeripheral = peripheral
//        peripheral.delegate = self
//    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        //Succesfully conected. Store reference to peripheral if not already donde.
        self.connectedPeripheral = peripheral
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        //Handle error
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let error = error {
            //Handle error
            return
        }
        //Successfully disconnected
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        discoverCharacteristics(peripheral: peripheral)
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        //Consider storing important characteristics internally for easy access and equivalency checks later.
        //From here, can read/write to characteristics or subscribe to notifications as desired.
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        guard let descriptors = characteristic.descriptors else { return }

        //Get user description descriptor
        if let userDescriptionDescriptor = descriptors.first(where: {
            return $0.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString
        }) {
            //Read user description for characteristic
            peripheral.readValue(for: userDescriptionDescriptor)
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        //Get and print user description for a given characteristic
        if descriptor.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString,
           let userDescription = descriptor.value as? String {
            print("Characterstic \(descriptor.characteristic?.uuid.uuidString) is also known as \(userDescription)")
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            //Handle error
            return
        }
        //Successfully subscribed to or unsubscribed from notifications/indications on a characteristic
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            // Handle error
            return
        }
        guard let value = characteristic.value else { return }
        // Do something with data
    }

    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            // Handle error
            return
        }
        // Successfully wrote value to characteristic
    }

//    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
//        // Called when peripheral is ready to send write without response again.
//        // Write some value to some target characteristic.
//        write(value: someValue, characteristic: someCharacteristic)
//    }
//
}
