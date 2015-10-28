// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright © 2012 - Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: ZXDynamicAnimationView.h
// 创建日期: 15/10/21
// 创 建 人: 甄鑫
// 文件说明: <#content#>
// $_FILEHEADER_END ******************************


#import <UIKit/UIKit.h>

typedef void(^ZXDynamicAnimationFinishCb)(id result);
@interface ZXDynamicAnimationView : UIView<UICollisionBehaviorDelegate,UIDynamicAnimatorDelegate>
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIView            *mpBgView;

- (void)setFinishCb:(ZXDynamicAnimationFinishCb)cb;
//***********************************************************************
//                          小球落地动画
//***********************************************************************
- (void)setBallDropDownView:(UIView *)ballView;
- (void)beginBallDownAnimation;

@end
