
// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright (C) 2012-  Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: ModuleManager.h
// 创建日期: 20150320 18:45
// 代码作者: 白枫
// 文件说明: 全局视图控制器管理器
// $_FILEHEADER_END *****************************

#ifndef __PP_VC_MANAGER_H__
#define __PP_VC_MANAGER_H__

#import <Foundation/Foundation.h>

typedef enum _MODULE_PAGE_INDEX {
    MODULE_MSG_PAGE = 0,
    MODULE_TALK_PAGE,
    MODULE_FRIEND_PAGE,
    MODULE_USER_PAGE,
    MODULE_MAIN_PAGE,
} MODULE_PAGE_INDEX;

@interface PPVcManager : NSObject
//视图换页
-(void)switchTabPage:(MODULE_PAGE_INDEX)kValue;
-(MODULE_PAGE_INDEX)getTabIndex;
//保留全局引用
-(void)setNavigationController:(MODULE_PAGE_INDEX)kValue withVC:(UINavigationController*)_vc;
-(UINavigationController*)getNavigationController:(MODULE_PAGE_INDEX)kValue;
-(UINavigationController*)getCurNavigationController;
-(void)setMainBarController:(UITabBarController*)_tc;
-(UITabBarController*)getMainBarController;
-(void)setUIWindow:(UIWindow*)_window;
-(UIWindow*)getUIWindow;
//通过appdelegate获取最顶层视图
- (UIViewController *)fetchCurTopViewController;
//获取管理器单例
+(PPVcManager*)getInstance;
@end

#define PPMM [PPVcManager getInstance]

#endif
