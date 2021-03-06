//
//  OwnerViewController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "OwnerViewController.h"
#import "Masonry.h"
#import "JWShareView.h"

@interface OwnerViewController ()

@end

@implementation OwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
     self.navigationItem.title = @"用户登录";
     self.view.backgroundColor = [UIColor whiteColor];
    
     [self setupFrame];

}
-(void)setupFrame{
    __weak typeof(self) weakSelf = self;
    
    //标题label
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.text = @"使用账号和密码登录";
    [self.view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).with.offset(100);
        make.centerX.equalTo(weakSelf.view);
       
    }];
    
   //账号
    UILabel *accountLabel = [[UILabel alloc]init];
    accountLabel.text = @"账号";
    accountLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:accountLabel];
    
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(30);
        make.left.equalTo(weakSelf.view).with.offset(30);
    }];
    
    //账号输入
    UITextField *accountField = [[UITextField alloc]init];
    accountField.placeholder = @"手机号码/邮箱地址";
    accountField.font = [UIFont systemFontOfSize:15];
    accountField.keyboardType = UIKeyboardTypeEmailAddress;
    [self.view addSubview:accountField];
    
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(accountLabel);
        make.left.equalTo(accountLabel.mas_right).with.offset(20);
    }];
    
    //第一条横线
    UIView *firstView = [[UIView alloc]init];
    firstView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:firstView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.top.equalTo(accountLabel.mas_bottom).with.offset(20);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        
    }];
    
    //密码
    UILabel *pwdLabel = [[UILabel alloc]init];
    pwdLabel.font = [UIFont systemFontOfSize:15];
    pwdLabel.text = @"密码";
    [self.view addSubview:pwdLabel];
    
    [pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_bottom).with.offset(20);
        make.centerX.equalTo(accountLabel);
        
    }];
    
    //密码输入
    UITextField *pwdField = [[UITextField alloc]init];
    pwdField.font = [UIFont systemFontOfSize:15];
    pwdField.placeholder = @"请输入密码";
    pwdField.secureTextEntry = YES;
    [self.view addSubview:pwdField];
    
    [pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(pwdLabel);
        make.left.equalTo(pwdLabel.mas_right).with.offset(20);
    }];
    
    //第二条横线
    UIView *secondView = [[UIView alloc]init];
    secondView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:secondView];
    
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.top.equalTo(pwdLabel.mas_bottom).with.offset(20);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        
    }];

    //登录按钮
    UIButton *loginBtn = [[UIButton alloc]init];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn setBackgroundColor:[UIColor blueColor]];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登     录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(15);
        make.right.equalTo(weakSelf.view).with.offset(-15);
        make.top.equalTo(secondView.mas_bottom).with.offset(30);
    }];
    
    UIView *vieww = [[UIView alloc]init];
    vieww.frame = CGRectMake(weakSelf.view.width/2, 0, 1, weakSelf.view.height);
    vieww.backgroundColor = [UIColor clearColor];

    [self.view addSubview:vieww];
    
    //找回密码
    UIButton *retrievePwd = [[UIButton alloc]init];
    [retrievePwd setTitle:@"找回密码" forState:UIControlStateNormal];
    [retrievePwd setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [retrievePwd setBackgroundColor:[UIColor clearColor]];
    retrievePwd.titleLabel.font = [UIFont systemFontOfSize:14];
    [retrievePwd addTarget:self action:@selector(clickRetrievePwd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:retrievePwd];
    
    [retrievePwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).with.offset(15);
        make.right.equalTo(vieww.mas_left).with.offset(-10);
        
    }];
    
    //用户注册
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"用户注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [registerBtn setBackgroundColor:[UIColor clearColor]];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [registerBtn addTarget:self action:@selector(clickRetgisterBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).with.offset(15);
        make.left.equalTo(vieww.mas_left).with.offset(10);
        
    }];
    
    //其他方式登录
    UIButton *otherBtn = [[UIButton alloc]init];
    [otherBtn setTitle:@"其他方式登录" forState:UIControlStateNormal];
    [otherBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [otherBtn setBackgroundColor:[UIColor clearColor]];
    otherBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [otherBtn addTarget:self action:@selector(clickOtherBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherBtn];
    
    [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-60);
        make.centerX.equalTo(weakSelf.view);
        
    }];
    
}

//点击登录按钮
-(void)clickLoginBtn{
    MemberCenterViewController *memberVC = [MemberCenterViewController new];
    [self.navigationController pushViewController:memberVC animated:YES
     ];
}

//点击找回密码
-(void)clickRetrievePwd{
    RetrievePwdViewController *memberVC = [RetrievePwdViewController new];
    [self.navigationController pushViewController:memberVC animated:YES
     ];

}

//点击用户注册
-(void)clickRetgisterBtn{
    RegisterViewController *memberVC = [RegisterViewController new];
    [self.navigationController pushViewController:memberVC animated:YES
     ];
}

//点击其他方式登录
-(void)clickOtherBtn{
    NSArray *contentArray = @[@{@"name":@"QQ",@"icon":@"sns_icon_qq"},
        @{@"name":@"微信",@"icon":@"sns_icon_wechat"},
        @{@"name":@"新浪微博",@"icon":@"sns_icon_weibo"},
                              ];
    JWShareView *shareView = [[JWShareView alloc] init];
    [shareView addShareItems:self.view shareItems:contentArray selectShareItem:^(NSInteger tag, NSString *title) {
        NSLog(@"%ld --- %@", tag, title);
    }];
}

//键盘消失
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
