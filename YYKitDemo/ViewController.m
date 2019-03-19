//
//  ViewController.m
//  YYKitDemo
//
//  Created by tangshenchun on 2019/3/19.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "ViewController.h"

#import <YYKit.h>

#define kAppFrameWidth      [[UIScreen mainScreen] bounds].size.width
#define kAppFrameHeight     [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()


@property (nonatomic, strong)   YYLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self clicked];
    
    [self showall];
    
    
}


-(void)showall{
    
    
    _label = [YYLabel new];
    _label.userInteractionEnabled =YES;
    _label.numberOfLines =3;
    _label.backgroundColor = [UIColor redColor];
    _label.textVerticalAlignment =YYTextVerticalAlignmentTop;
    [self.view addSubview:_label];
    
    
    self.label.frame = CGRectMake(15,150,kAppFrameWidth -30,70);
    
    
    _label.text =@"今天凌晨，苹果再一次为我们带来了iOS 11.1 Beta 3。不过在iOS 11.1 beta 3中，苹果并没有增加新功能，而是修复了很多bug和安全问题。当然，正如我们之前所提到的，iOS 11.1看起来也为即将到来的iPhone X准备了很多的新功能，所以在iPhone X推出之前，我们应该很有可能会看到正式版的iOS 11.1到来。"@"首先、3D Touch操作变得更流畅，修复了延迟。这对于很多喜欢和习惯使用3D Touch的朋友来说，绝对是一个好消息。"@"第二、修复严重的WiFi WPA2安全漏洞。根据国外研究人员披露，最新的WiFi WPA2加密协议漏洞加密协议漏洞影响到了数百万的路由器设备、智能加密协议漏洞影响到了数百万的路由器设备、智能影响到了数百万的路由器设备、智能手机、个人电脑以及其他的设备，包含苹果Mac、iPhone以及iPad。不过幸好在最新的测试版系统当中，苹果已经修复了这个严重的漏洞",@"第二、修复严重的WiFi WPA2安全漏洞。根据国外研究人员披露，最新的WiFi WPA2加密协议漏洞加密协议漏洞影响到了数百万的路由器设备、智能加密协议漏洞影响到了数百万的路由器设备、智能影响到了数百万的路由器设备、智能手机、个人电脑以及其他的设备，包含苹果Mac、iPhone以及iPad。不过幸好在最新的测试版系统当中，苹果已经修复了这个严重的漏洞",@"第二、修复严重的WiFi W";
    
    [self addSeeMoreButton];
}



- (void)addSeeMoreButton {
    
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...展开"];
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor purpleColor]];
    [text setTextHighlight: hi range:[text.string rangeOfString:@"展开"]];
    
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {
        
        NSLog(@"展开全部");
    };
    
    
    [text setColor:[UIColor yellowColor] range:[text.string rangeOfString:@"展开"]];
    
    text.font =_label.font;
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    
    NSAttributedString *truncationToken = [NSAttributedString attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize: text.size  alignToFont:text.font alignment:YYTextVerticalAlignmentCenter];
    _label.truncationToken = truncationToken;
    
}





-(void)clicked{
    
    NSString *agreementText = @"点击登录即表示已同意并同意《xxx用户协议》与《xxx隐私政策》";
    NSMutableAttributedString *text =[[NSMutableAttributedString alloc] initWithString:agreementText];
    text.lineSpacing = 3;
    text.font = [UIFont systemFontOfSize:14];
    text.color = [UIColor purpleColor];
    
    [text setFont:[UIFont systemFontOfSize:18] range:NSMakeRange(agreementText.length-9, 9)];
    
    [text setTextHighlightRange:NSMakeRange(13, 9) color:[UIColor blueColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"用户协议被点击了");
    }];
    
    
    [text setTextHighlightRange:NSMakeRange(agreementText.length-9, 9) color:[UIColor redColor]
                backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                    NSLog(@"用户协议被点击了111");
                }];
    
    YYLabel *agreementLabel = [YYLabel new];
    agreementLabel.numberOfLines = 0;
    agreementLabel.preferredMaxLayoutWidth = kScreenWidth-85;//最大宽度
    agreementLabel.attributedText = text;
    agreementLabel.frame = CGRectMake(20, 240,  kScreenWidth-85, 140);
    [self.view addSubview:agreementLabel];
}


@end
