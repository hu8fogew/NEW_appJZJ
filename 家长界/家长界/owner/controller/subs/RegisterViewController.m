//
//  RegisterViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "RegisterViewController.h"
#import "Masonry.h"
#import "OwnerViewController.h"
#import "UIResponder+FirstResponder.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController{
    BOOL keyboardIsShowing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self enableEditTextScroll];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)]];
    

    [self setupFrame];
    
}

#pragma mark =====控件布局=====
-(void)setupFrame{
    //////////////
    UILabel *registerLabel = [UILabel new];
    registerLabel.font = [UIFont systemFontOfSize:23];
    registerLabel.text = @"会员注册";
    [self.view addSubview:registerLabel];
    
    [registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(120);
        make.centerX.equalTo(self.view);
        
        }];
    /////////
    UILabel *classLabel = [UILabel new];
    classLabel.font = [UIFont systemFontOfSize:16];
    classLabel.text = @"类别";
    [self.view addSubview:classLabel];
    
    [classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registerLabel.mas_bottom).with.offset(30);
        make.left.equalTo(self.view).with.offset(10);
    }];
    /////////////
    UIButton *classBtn = [UIButton new];
    classBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [classBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [classBtn setTitle:@"请选择" forState:UIControlStateNormal];
    [classBtn addTarget:self action:@selector(clickClassBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:classBtn];
    
    [classBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(60);
        make.centerY.equalTo(classLabel);
        make.right.equalTo(self.view).with.offset(-36);
        
    }];
    //////////
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"grayArrow.png"];
    [self.view addSubview:imgView];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(classBtn.mas_right).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.centerY.equalTo(classBtn);
    }];
    /////////
    UIView *firstView = [UIView new];
    firstView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:firstView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(classLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *phoneLabel = [UILabel new];
    phoneLabel.text = @"手机号";
    phoneLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:phoneLabel];
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(10);
        
    }];
    
    //////
    UITextField *phoneField = [UITextField new];
    phoneField.font = [UIFont systemFontOfSize:16];
    phoneField.keyboardType = UIKeyboardTypePhonePad;

    [self.view addSubview:phoneField];
    
    [phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLabel.mas_right).with.offset(20);
        make.right.equalTo(self.view).with.offset(-5);
        make.centerY.equalTo(phoneLabel);
    }];
    
    /////////
    UIView *secondView = [UIView new];
    secondView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:secondView];
    
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
        make.height.mas_equalTo(1);
    }];
    //////
    UILabel *commitLabel = [UILabel new];
    commitLabel.font = [UIFont systemFontOfSize:16];
    commitLabel.text = @"验证码";
    [self.view addSubview:commitLabel];
    
    [commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secondView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(10);
    }];
    ////////
    UITextField *commitField = [UITextField new];
    commitField.placeholder = @"请输入验证码";
    commitField.font = [UIFont systemFontOfSize:16];
    commitField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:commitField];
    
    [commitField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(commitLabel);
        make.left.equalTo(commitLabel.mas_right).with.offset(20);
    }];
    //////////
    UIButton *commitBtn = [UIButton new];
    commitBtn.backgroundColor = [UIColor darkGrayColor];
    commitBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    commitBtn.layer.cornerRadius = 4;
    [commitBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(clickCommitBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];
    
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secondView.mas_bottom).with.offset(20);
        make.right.equalTo(self.view).with.offset(-12);
    }];
    ////////
    UIView *thirdView = [UIView new];
    thirdView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:thirdView];
    
    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(commitLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
        make.height.mas_equalTo(1);
    }];
    /////////
    UILabel *pwdLabel = [UILabel new];
    pwdLabel.text = @"密码";
    pwdLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:pwdLabel];
    
    [pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(10);
        
    }];
    
    //////
    UITextField *pwdField = [UITextField new];
    pwdField.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:pwdField];
    
    [pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdLabel.mas_right).with.offset(20);
        make.right.equalTo(self.view).with.offset(-5);
        make.centerY.equalTo(pwdLabel);
    }];
    
    /////////
    UIView *fourthView = [UIView new];
    fourthView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:fourthView];
    
    [fourthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
        make.height.mas_equalTo(1);
    }];
    
    /////////
    UILabel *resetLabel = [UILabel new];
    resetLabel.text = @"重置密码";
    resetLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:resetLabel];
    
    [resetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourthView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(10);
        
    }];
    
    //////
    UITextField *resetField = [UITextField new];
    resetField.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:resetField];
    
    [resetField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(resetLabel.mas_right).with.offset(20);
        make.right.equalTo(self.view).with.offset(-5);
        make.centerY.equalTo(resetLabel);
    }];
    
    /////////
    UIView *fifthView = [UIView new];
    fifthView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:fifthView];
    
    [fifthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(resetLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
        make.height.mas_equalTo(1);
    }];
    ////////
    UIButton *registerBtn = [UIButton new];
    registerBtn.backgroundColor = [UIColor blueColor];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    registerBtn.layer.cornerRadius = 4;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickregisterBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fifthView.mas_bottom).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.left.equalTo(self.view).with.offset(20);
        
    }];
    /////
    UIButton *loginBtn = [UIButton new];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [loginBtn setTitle:@"已经是会员，请登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registerBtn.mas_bottom).with.offset(50);
        make.centerX.equalTo(self.view);
    }];

    
}
#pragma mark *****类别选择******
-(void)clickClassBtn{
    HWLog(@"fdfddddddd");

}
#pragma mark ******获取验证码******
-(void)clickCommitBtn{
    HWLog(@"7777777");

}
#pragma mark *****注册按钮******
-(void)clickregisterBtn{
 
}
#pragma mark *****会员登录******
-(void)clickLoginBtn{
    OwnerViewController *memberCenter = [OwnerViewController new];
    [self.navigationController pushViewController:memberCenter animated:YES];
}


#pragma mark -------文本框上移--------
- (void)viewClicked{
    if(keyboardIsShowing){
        id responder = [UIResponder currentFirstResponder];
        if([responder isKindOfClass:[UITextView class]] || [responder isKindOfClass:[UITextField class]]){
            UIView *view = responder;
            [view resignFirstResponder];
        }
    }
}

- (CGFloat)shouldScrollWithKeyboardHeight:(CGFloat)keyboardHeight{
    id responder = [UIResponder currentFirstResponder];
    if([responder isKindOfClass:[UITextView class]] || [responder isKindOfClass:[UITextField class]]){
        CGFloat y = self.view.frame.origin.y;
        CGFloat bottom = y + self.view.frame.size.height-216;
        if(bottom > SCREEN_HEIGHT - keyboardHeight){
            return bottom - (SCREEN_HEIGHT - keyboardHeight);
        }
    }
    return 0;
}

- (void)enableEditTextScroll{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardDidHide) name:UIKeyboardDidHideNotification object:nil];
}

- (void)wpKeyboardDidShow{
    keyboardIsShowing = YES;
}

- (void)wpKeyboardDidHide{
    keyboardIsShowing = NO;
}

- (void)wpKeyboardWillHide:(NSNotification *)note {
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    __weak RegisterViewController *weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        CGRect bounds = weakSelf.view.bounds;
        weakSelf.view.bounds = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    }];
}

- (void)wpKeyboardWillShow:(NSNotification *)note {
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat keyboardHeight = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat shouldScrollHeight = [self shouldScrollWithKeyboardHeight:keyboardHeight];
    if(shouldScrollHeight == 0){
        return;
    }
    __weak RegisterViewController *weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        CGRect bounds = weakSelf.view.bounds;
        weakSelf.view.bounds = CGRectMake(0, shouldScrollHeight + 10, bounds.size.width, bounds.size.height);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
