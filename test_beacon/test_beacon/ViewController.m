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
@synthesize peripheralManager, centralManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *identifier = @"1F6312DC-0C22-4076-9FD9-ACFA447ED45A";
    peripheralManager = [[CBPeripheralManager alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *advertisingData = @{CBAdvertisementDataLocalNameKey:@"my-peripheral",
                                      CBAdvertisementDataServiceUUIDsKey:@[[CBUUID UUIDWithString:identifier]]};
    
    // Start advertising over BLE
    [peripheralManager startAdvertising:advertisingData];
    centralManager = [[CBCentralManager alloc] init];
    NSDictionary *scanOptions = @{CBCentralManagerScanOptionAllowDuplicatesKey:@(YES)};
    NSArray *services = @[[CBUUID UUIDWithString:identifier]];
    
    [centralManager scanForPeripheralsWithServices:services options:scanOptions];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    
    NSLog(@"RSSI: %d", [RSSI intValue]);
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
