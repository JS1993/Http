//
//  ViewController.m
//  Demo2_JS_Http
//
//  Created by  江苏 on 16/3/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.发出http请求时，首先需要知道请求的地址和参数
    NSString* path=@"http://ws.webxml.com.cn/WebServices/MobileCodeWS.asmx/getMobileCodeInfo?mobileCode=18175022904&userID=";
    NSURL* url=[NSURL URLWithString:path];
    //2.创建请求对象
    NSMutableURLRequest* request=[NSMutableURLRequest requestWithURL:url];
    //发出同步请求 IOS9.0之后已弃用
//    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString* xmlString=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",xmlString);
    //iOS 9 提供了 NSURLSession 来代替  NSURLConnection
    //首先，创建一个 NSURLSession 对象（如果要使用block来完成网络请求，这个对象可以使用 NSURLSession 自带的单例对象）
    NSURLSession *session = [NSURLSession sharedSession];
    
    // session发送网络请求对象
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString* xmlString=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",xmlString);
    }];
    //开始网络请求任务
    [task resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
