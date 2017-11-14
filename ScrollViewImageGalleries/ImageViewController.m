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
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image = self.passedThruImage;
    self.imageDetail.contentSize = CGSizeMake(self.view.bounds.size.width, self.imageDetail.bounds.size.height*1.5);
    self.imageDetail.delegate = self;
    self.view.backgroundColor = [UIColor blackColor];

}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    self.imageDetail.minimumZoomScale = 0.5;
    self.imageDetail.maximumZoomScale = 2;
    return self.image;
}
            

- (IBAction)dismissController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
