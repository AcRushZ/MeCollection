//
//  PPClient.m
//  fTalk
//
//  Created by baifeng on 15/3/20.
//
//

#import <Foundation/Foundation.h>
#import "PPClient.h"
//#import "SystemField.h"
//#import "DeviceCommand.h"
//#import "UserDataCommand.h"

static PPClient* _instance = nil;

@implementation PPClient : Facade

-(id)init;
{
    id ret = [super init];
    return ret;
}

+(id<IFacade>)getInstance
{
    if (_instance == nil) {
        _instance = [[PPClient alloc] init];
    }
    return _instance;
}

-(void)initializeController
{
    [super initializeController];
    
//    [self registerCommand:kSystemCommandDeviceStartUp
//           commandClassRef:[DeviceStartUpCommand class]];
//    [self registerCommand:kSystemCommandDeviceShutDown
//           commandClassRef:[DeviceShutDownCommand class]];
//    [self registerCommand:kSystemCommandDeviceSleep
//           commandClassRef:[DeviceSleepCommand class]];
//    [self registerCommand:kSystemCommandDeviceWakeup
//          commandClassRef:[DeviceWakeupCommand class]];
//    [self registerCommand:kSystemCommandLoadUserData
//          commandClassRef:[LoadUserDataCommand class]];
//    [self registerCommand:kSystemCommandSaveUserData
//          commandClassRef:[SaveUserDataCommand class]];
}

-(void)initializeView
{
    [super initializeView];
}

-(void)initializeModel
{
    [super initializeModel];
}

@end
