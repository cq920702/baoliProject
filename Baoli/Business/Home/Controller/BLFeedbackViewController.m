//
//  BLFeedbackViewController.m
//  Baoli
//
//  Created by Roy Chan on 17/1/9.
//  Copyright © 2017年 user. All rights reserved.
//

#import "BLFeedbackViewController.h"
#import "UIColor+Extra.h"
#import "EMTextView.h"
#import "UIColor+Extend.h"
#import "UIFont+Extra.h"
@interface BLFeedbackViewController ()<UITextViewDelegate,UITextFieldDelegate>
{
    EMTextView *_replayTextView;
}
@property (weak, nonatomic) IBOutlet UIView *typeView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation BLFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"意见反馈";
    self.view.backgroundColor=[UIColor defaultBackgroundColor];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"发送"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(sendAction)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self setConfig];
}

-(void)setConfig{
    
    _typeView.layer.borderColor = ([[UIColor lightGrayColor] CGColor]);
    _typeView.layer.borderWidth = 0.5;
    _typeView.layer.cornerRadius = 3;
    
    int wide=(ScreenWidth-80)/3;
    UIButton *softButton=[UIButton buttonWithType:UIButtonTypeCustom];
    softButton.frame=CGRectMake(20, 15, wide, 30);
    [self setButtonWithButton:softButton Title:@"软件问题"];
    softButton.backgroundColor=[UIColor colorWithHexString:@"4792e5"];
    [softButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.typeView addSubview:softButton];
    
    UIButton *facilityButton=[UIButton buttonWithType:UIButtonTypeCustom];
    facilityButton.frame=CGRectMake(40+wide, 15, wide, 30);
    [self setButtonWithButton:facilityButton Title:@"小区设施"];
    [self.typeView addSubview:facilityButton];
    
    UIButton *safeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    safeButton.frame=CGRectMake(60+wide*2, 15, wide, 30);
    [self setButtonWithButton:safeButton Title:@"治安反应"];
    [self.typeView addSubview:safeButton];
    
    UIButton *carButton=[UIButton buttonWithType:UIButtonTypeCustom];
    carButton.frame=CGRectMake(20, 55, wide, 30);
    [self setButtonWithButton:carButton Title:@"车位问题"];
    [self.typeView addSubview:carButton];
    
    UIButton *otherButton=[UIButton buttonWithType:UIButtonTypeCustom];
    otherButton.frame=CGRectMake(40+wide, 55, wide, 30);
    [self setButtonWithButton:otherButton Title:@"其他"];
    [self.typeView addSubview:otherButton];
    
    _replayTextView=[[EMTextView alloc] init];
    _replayTextView.frame=CGRectMake(0, CGRectGetMaxY(self.contentLabel.frame)+10, ScreenWidth, 150);
    _replayTextView.layer.borderColor = ([[UIColor lightGrayColor] CGColor]);
    _replayTextView.layer.borderWidth = 0.5;
    _replayTextView.layer.cornerRadius = 3;
    _replayTextView.font = [UIFont systemFontOfSize:14.0];
    _replayTextView.backgroundColor = [UIColor whiteColor];
    _replayTextView.returnKeyType = UIReturnKeyDone;
    _replayTextView.placeholder=@"保利倾听每一个业主的宝贵意见";
    _replayTextView.delegate = self;
    [self.view addSubview:_replayTextView];
    
    UILabel *contact=[[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_replayTextView.frame)+10, 100, 20)];
    contact.text=@"联系电话";
    [self.view addSubview:contact];
    
    UIView *contactPhoneView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(contact.frame)+10, ScreenWidth, 30)];
    contactPhoneView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    contactPhoneView.layer.borderWidth=1;
    contactPhoneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:contactPhoneView];
    
    UITextField *contactPhone=[[UITextField alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth-20, 30)];
    contactPhone.font=[UIFont defaultMediumFont];
    contactPhone.backgroundColor=[UIColor whiteColor];
    contactPhone.placeholder=@"请输入手机号码";
    [contactPhoneView addSubview:contactPhone];
}

-(void)setButtonWithButton:(UIButton *)button Title:(NSString *)title{
    button.titleLabel.font=[UIFont defaultMediumFont];
    button.layer.borderWidth=1;
    button.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [button setTitleColor:[UIColor defaultTextColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];

}

-(void)sendAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}


@end
