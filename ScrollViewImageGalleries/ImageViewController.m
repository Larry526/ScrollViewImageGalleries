//
//  ImageViewController.m
//  ScrollViewImageGalleries
//
//  Created by Larry Luk on 2017-11-13.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageDetail;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageDetail.minimumZoomScale = 0.5;
    self.imageDetail.maximumZoomScale = 2;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageDetail;
}

@end
