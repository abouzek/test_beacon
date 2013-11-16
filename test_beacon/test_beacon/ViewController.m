//
//  ViewController.m
//  test_beacon
//
//  Created by Alan Bouzek on 11/15/13.
//  Copyright (c) 2013 Alan Bouzek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize peripheralManager, centralManager, distanceLabel;
int limit = 0;

NSString *identifier = @"1F6312DC-0C22-4076-9FD9-ACFA447ED45A";

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSDictionary *scanOptions = @{CBCentralManagerScanOptionAllowDuplicatesKey:@(YES)};
    NSArray *services = @[[CBUUID UUIDWithString:identifier]];
    NSLog(@"central");
    
    [centralManager scanForPeripheralsWithServices:services options:scanOptions];}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    NSDictionary *advertisingData = @{CBAdvertisementDataLocalNameKey:@"my-peripheral",
                                      CBAdvertisementDataServiceUUIDsKey:@[[CBUUID UUIDWithString:identifier]]};
    NSLog(@"peripheral");
    [peripheralManager startAdvertising:advertisingData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // Start advertising over BLE
//    
//    while (centralManager.state != CBCentralManagerStatePoweredOn && peripheralManager.state != CBPeripheralManagerStatePoweredOn);
    
    
    
    
    centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];

}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    
    NSLog(@"RSSI: %d", [RSSI intValue]);
    
    limit++;
    if (limit % 2 == 0) {
        distanceLabel.text = [NSString stringWithFormat:@"%d", [RSSI intValue]];
    }
}

//- (INDetectorRange)convertRSSItoINProximity:(NSInteger)proximity
//{
//    if (proximity < -70)
//        return INDetectorRangeFar;
//    if (proximity < -55)
//        return INDetectorRangeNear;
//    if (proximity < 0)
//        return INDetectorRangeImmediate;
//    
//    return INDetectorRangeUnknown;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
