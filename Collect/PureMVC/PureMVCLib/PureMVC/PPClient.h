
// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright (C) 2012-  Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: SystemField.h
// 创建日期: 20150320 15:11
// 代码作者: 白枫
// 文件说明: MVC - 系统外观
// $_FILEHEADER_END *****************************

#ifndef __PP_CLIENT_H__
#define __PP_CLIENT_H__

#import "Facade.h"
#import "Observer.h"

@interface PPClient : Facade
-(id)init;
+(id<IFacade>)getInstance;
-(void)initializeController;
-(void)initializeView;
-(void)initializeModel;
@end

#define PPCLIENT ((PPClient*)[PPClient getInstance])
#define PPCLIENT_REGISTER_OBSERVER(NAME, SEL, OBJCET) [PPCLIENT.view registerObserver:NAME observer:[Observer withNotifyMethod:SEL notifyContext:OBJCET]]
#define PPCLIENT_UNREGISTER_OBSERVER(NAME, OBJECT) [PPCLIENT.view removeObserver:NAME notifyContext:OBJECT]
#define PPCLIENT_PROXY(key) [PPCLIENT retrieveProxy:key]
#define PPCLIENT_MEDIATOR(key) [PPCLIENT retrieveMediator:key]

#endif
