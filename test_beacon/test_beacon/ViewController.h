//
//  ViewController.h
//  test_beacon
//
//  Created by Alan Bouzek on 11/15/13.
//  Copyright (c) 2013 Alan Bouzek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralManagerDelegate>


@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheralManager *peripheralManager;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@end
