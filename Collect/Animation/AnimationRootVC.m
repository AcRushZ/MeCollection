// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright © 2012 - Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: AnimationRootVC.m
// 创建日期: 15/10/21
// 创 建 人: 甄鑫
// 文件说明: <#content#>
// $_FILEHEADER_END ******************************


#import "AnimationRootVC.h"
#import "MainViewController.h"
#import "ZXDynamicAnimationView.h"

@interface AnimationRootVC ()  <UICollisionBehaviorDelegate>

@end

@implementation AnimationRootVC
{
    ZXDynamicAnimationView * bkView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView * ballView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    ballView.center = self.view.center;
    [ballView setBackgroundColor:[UIColor redColor]];

    [self.view addSubview:ballView];
    
    ZXDynamicAnimationView * bkView = [[ZXDynamicAnimationView alloc]init];
    [bkView setMpBgView:self.view];
    [bkView setFinishCb:^(id result) {
        
    }];
    
    [bkView setBallDropDownView:ballView];
    [bkView beginBallDownAnimation];

    
    [self.view addSubview:bkView];

    
    
    [self selfTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickGotoDynaimc:(id)sender
{
    MainViewController * vc = [[MainViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)selfTest
{

}

@end
