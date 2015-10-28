// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright © 2012 - Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: ZXDynamicAnimationView.m
// 创建日期: 15/10/21
// 创 建 人: 甄鑫
// 文件说明: <#content#>
// $_FILEHEADER_END ******************************


#import "ZXDynamicAnimationView.h"

@implementation ZXDynamicAnimationView
{
    ZXDynamicAnimationFinishCb _saveFinishCb;
    
    UIView * _mpBgView;
    UIView * _mpBallView;
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        UIView * bgView = _mpBgView ?:self;
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:bgView];
        _animator.delegate = self;
    }
    return _animator;
}

- (UIView *)mpBgView
{
    if (!_mpBgView)
    {
        return self;
    }
    return _mpBgView;
}

- (void)setFinishCb:(ZXDynamicAnimationFinishCb)cb
{
    _saveFinishCb = cb;
}

//***********************************************************************
//                          小球落地动画
//***********************************************************************

- (void)setBallDropDownView:(UIView *)ballView
{
    _mpBallView = ballView;
    
    if (!ballView.superview)
    {
        [[self mpBgView]addSubview:_mpBallView];
    }
}

- (void)beginBallDownAnimation
{
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_mpBallView]];
    [self.animator addBehavior:gravityBehavior];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_mpBallView]];
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    [self.animator addBehavior:collisionBehavior];

    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_mpBallView]];
    [itemBehavior setElasticity:0.2];
    [self.animator addBehavior:itemBehavior];
    [collisionBehavior setCollisionDelegate:self];
}

#pragma mark - **************** UICollisionBehaviorDelegate
- (void)collisionBehavior:(UICollisionBehavior *)behavior
      endedContactForItem:(id <UIDynamicItem>)item
   withBoundaryIdentifier:(id <NSCopying>)identifier
{ // 每一次触发边界

}

#pragma mark - **************** UIDynamicAnimatorDelegate
- (void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator
{ // 开始
    
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{ // 结束
    if (_saveFinishCb)
    {
        _saveFinishCb(@(YES));
    }
}
@end
