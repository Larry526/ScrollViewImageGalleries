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
@property (strong, nonatomic) UIImage *image;
@property (strong,nonatomic) UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.imageScrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.imageScrollView.bounds.size.height);
    
    for (NSInteger i = 1; i <= 3; i++) {
        CGRect frame  = CGRectMake(self.view.bounds.size.width * (i - 1),0,self.view.bounds.size.width,self.imageScrollView.bounds.size.height);
        UIImageView *image = [[UIImageView alloc]initWithFrame:frame];
        image.image = [UIImage imageNamed:[NSString stringWithFormat: @"%li",i]];
        [self.imageScrollView addSubview:image];
        self.imageScrollView.delegate = self;
        image.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
        [image addGestureRecognizer:tapGesture];
        
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - 100, self.view.bounds.size.width, 50)];
        [self.view addSubview:self.pageControl];
        self.pageControl.layer.zPosition = 100;
        self.pageControl.alpha = 0.5;
        self.pageControl.numberOfPages = 3;
        
        
        
                                      
        
    }
    
    self.imageScrollView.pagingEnabled = YES;

}

- (void) viewTapped: (UITapGestureRecognizer*)sender {
    self.image = ((UIImageView*)sender.view).image;
    [self performSegueWithIdentifier:@"id" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"id"]) {
        ImageViewController *secondVC = [segue destinationViewController];
        secondVC.passedThruImage = self.image;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    float fractionalPage = self.imageScrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}



@end
