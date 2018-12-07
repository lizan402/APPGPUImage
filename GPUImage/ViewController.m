//
//  ViewController.m
//  GPUImage
//
//  Created by 李赞 on 2018/12/6.
//  Copyright © 2018年 李赞. All rights reserved.
//

#import "ViewController.h"
#import <GPUImage/GPUImage.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc]init];
    [disFilter forceProcessingAtSize:self.imageview.frame.size];
    [disFilter useNextFrameForImageCapture];
    
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:self.imageview.image];
    [stillImageSource addTarget:disFilter];
    [stillImageSource processImage];
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(100, 400, self.imageview.frame.size.width, self.imageview.frame.size.height);
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
