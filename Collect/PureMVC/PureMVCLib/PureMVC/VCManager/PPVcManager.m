//
//  ModuleManager.m
//  fTalk
//
//  Created by baifeng on 15/3/20.
//
//

#import <Foundation/Foundation.h>
#import "PPVcManager.h"
#import "PPClient.h"

#define MODULE_SIZE_MAX 5

@implementation PPVcManager
{
    __strong UITabBarController* _mpMainBar;
    __strong UINavigationController* _mpNcGroup[MODULE_SIZE_MAX];
    __strong NSMutableArray* _mpNcNameArray[MODULE_SIZE_MAX];
    __strong UIWindow* _mpUIWindow;
    MODULE_PAGE_INDEX _mkCurPageIndex;
}

static PPVcManager* _instance = nil;

+(PPVcManager*)getInstance
{
    @synchronized(self)
    {
        if (_instance==nil) {
            _instance = [[PPVcManager alloc] init];
        }
    }
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i=0; i < MODULE_SIZE_MAX; i++) {
            _mpNcNameArray[i] = [[NSMutableArray alloc] initWithCapacity:16];
        }
        _mpUIWindow = nil;
    }
    return self;
}

- (void)dealloc
{
    _mpMainBar = nil;
    for (int i=0; i < MODULE_SIZE_MAX; i++) {
        _mpNcGroup[i] = nil;
        _mpNcNameArray[i] = nil;
    }
    _mpUIWindow = nil;
}

-(UIViewController*)getTopViewController
{
    /*NSMutableArray* _array = _mpNcNameArray[_mkCurPageIndex];
    if ([_array count] > 0) {
        NSString* _lastVC = [_array lastObject];
        return [self getViewController:_lastVC];
    }*/
    UINavigationController* _nc = _mpNcGroup[_mkCurPageIndex];
    return  [_nc.viewControllers lastObject];
}

- (UIViewController *)fetchCurTopViewController
{
    int liIndex = [ITUserCenter sharedUserCenter].miCurTabBar;
    NSArray *lpNvArray = [iTalkAppDelegate shareiTalkApp].tabBarController_cur.viewControllers;
    UIViewController *lpUIViewController = nil;

    if(liIndex < [lpNvArray count])
    {
        UINavigationController *lpNv = [lpNvArray objectAtIndex:liIndex];
        NSArray *lpTargetArray = lpNv.viewControllers;
        if(lpTargetArray.count > 0)
        {
            lpUIViewController = [lpTargetArray lastObject];
        }
    }
    ITLog(([NSString stringWithFormat:@"%@",lpUIViewController]));
    return lpUIViewController;
}

-(void)switchTabPage:(MODULE_PAGE_INDEX)kValue
{
    //MODULE_PAGE_INDEX _kOldIndex = _mkCurPageIndex;
    _mkCurPageIndex = kValue;
    if (_mpMainBar) {
        if (kValue >= MODULE_MSG_PAGE && kValue <= MODULE_USER_PAGE) {
            _mpMainBar.selectedIndex = kValue;
            [ITUserCenter sharedUserCenter].miCurTabBar = kValue;
        }
    }
    [PPCLIENT sendNotification:kSystemCommandMainBarChanged body:@(kValue)];
}

-(MODULE_PAGE_INDEX)getTabIndex
{
    return _mkCurPageIndex;
}

-(void)setNavigationController:(MODULE_PAGE_INDEX)kValue withVC:(UINavigationController*)_vc
{
    _mpNcGroup[kValue] = _vc;
}

-(UINavigationController*)getNavigationController:(MODULE_PAGE_INDEX)kValue
{
    return _mpNcGroup[kValue];
}

-(UINavigationController*)getCurNavigationController
{
    return [self getNavigationController:[self getTabIndex]];
}

-(void)setMainBarController:(UITabBarController*)_tc
{
    _mpMainBar = _tc;
    if (_tc) {
        [self switchTabPage:(MODULE_PAGE_INDEX)_tc.selectedIndex];
    }
}

-(UITabBarController*)getMainBarController
{
    return _mpMainBar;
}

-(void)setUIWindow:(UIWindow*)_window
{
    _mpUIWindow = _window;
}

-(UIWindow*)getUIWindow
{
    return _mpUIWindow;
}

@end

#undef MODULE_SIZE_MAX
