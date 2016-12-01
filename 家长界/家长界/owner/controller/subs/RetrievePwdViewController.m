//
//  RetrievePwdViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "RetrievePwdViewController.h"
#import "Masonry.h"

@interface RetrievePwdViewController ()

@end

@implementation RetrievePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
    [self setupFrame];
}

-(void)setupFrame{
    UILabel *pwdLabel = [UILabel new];
    pwdLabel.font = [UIFont systemFontOfSize:22];
    pwdLabel.text = @"找回密码";
    [self.view addSubview:pwdLabel];
    
    [pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(120);
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *phoneLabel = [UILabel new];
    phoneLabel.font = [UIFont systemFontOfSize:16];
    phoneLabel.text = @"手机号";
    [self.view addSubview:phoneLabel];
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdLabel.mas_bottom).with.offset(30);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    UITextField *phoneField = [UITextField new];
    phoneField.placeholder = @"请输入手机号";
    phoneField.font = [UIFont systemFontOfSize:16];
    phoneField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:phoneField];
    
    [phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneLabel);
        make.left.equalTo(self.view).with.offset(80);
        make.right.equalTo(self.view).with.offset(-5);
    }];
    
    UIView *firstView = [UIView new];
    firstView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:firstView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(phoneLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
    }];
    
    UILabel *commitLabel = [UILabel new];
    commitLabel.font = [UIFont systemFontOfSize:16];
    commitLabel.text = @"验证码";
    [self.view addSubview:commitLabel];
    
    [commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    UITextField *commitField = [UITextField new];
    commitField.placeholder = @"请输入验证码";
    commitField.font = [UIFont systemFontOfSize:16];
    commitField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:commitField];
    
    [commitField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(commitLabel);
        make.left.equalTo(commitLabel.mas_right).with.offset(12);
    }];
    
    UIButton *commitBtn = [UIButton new];
    commitBtn.backgroundColor = [UIColor darkGrayColor];
    commitBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    commitBtn.layer.cornerRadius = 4;
    [commitBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(clickCommitBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];
    
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_bottom).with.offset(20);
        make.right.equalTo(self.view).with.offset(-12);
    }];
    
    UIView *secondView = [UIView new];
    secondView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:secondView];
    
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(commitLabel.mas_bottom).with.offset(25);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
    }];
    
    UIButton *nextBtn = [UIButton new];
    nextBtn.backgroundColor = [UIColor blueColor];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    nextBtn.layer.cornerRadius = 4;
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secondView.mas_bottom).with.offset(30);
        make.right.equalTo(self.view).with.offset(-20);
        make.left.equalTo(self.view).with.offset(20);

    }];
}

-(void)clickCommitBtn{
    
}

-(void)clickNextBtn{
   
    
}

-(void)fingerTapped:(UITapGestureRecognizer*)gestureRecognizer{
    
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
