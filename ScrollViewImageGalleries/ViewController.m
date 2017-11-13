//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Larry Luk on 2017-11-13.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.imageScrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.imageScrollView.bounds.size.height);
    
    CGRect frame1 = CGRectMake(0,0,self.view.bounds.size.width,self.imageScrollView.bounds.size.height);
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:frame1];
    image1.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    [self.imageScrollView addSubview:image1];
    
    CGRect frame2 = CGRectMake(self.view.bounds.size.width,0,self.view.bounds.size.width,self.imageScrollView.bounds.size.height);
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:frame2];
    image2.image = [UIImage imageNamed:@"Lighthouse-night"];
    [self.imageScrollView addSubview:image2];
    
    CGRect frame3 = CGRectMake(self.view.bounds.size.width*2,0,self.view.bounds.size.width,self.imageScrollView.bounds.size.height);
    UIImageView *image3 = [[UIImageView alloc]initWithFrame:frame3];
    image3.image = [UIImage imageNamed:@"Lighthouse-zoomed"];
    [self.imageScrollView addSubview:image3];
    
    self.imageScrollView.pagingEnabled = YES;
    

}





@end
