//
//  DoctorVC.m
//  zDoctor
//
//  Created by David Iskander on 12/30/16.
//  Copyright © 2016 David Iskander. All rights reserved.
//

#import "DoctorVC.h"

@interface DoctorVC ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *profileLabelText;
@property (weak, nonatomic) IBOutlet UIView *profileUnderlineView;

@property (weak, nonatomic) IBOutlet UIView *insuranceView;
@property (weak, nonatomic) IBOutlet UILabel *insuranceLabelText;
@property (weak, nonatomic) IBOutlet UIView *insuranceUnderlineView;

@property (weak, nonatomic) IBOutlet UIView *reviewView;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabelText;
@property (weak, nonatomic) IBOutlet UIView *reviewUnderlineView;

@property (weak, nonatomic) IBOutlet UIView *contactView;
@property (weak, nonatomic) IBOutlet UILabel *contactLabelText;
@property (weak, nonatomic) IBOutlet UIView *contactUnderlineView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *profileVC;
@property (strong, nonatomic) UIView *insuranceVC;
@property (strong, nonatomic) UIView *reviewsVC;
@property (strong, nonatomic) UIView *contactVC;

@end

@implementation DoctorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.profileVC = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    self.profileVC.backgroundColor = [UIColor redColor];
    
    self.insuranceVC = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    self.insuranceVC.backgroundColor = [UIColor blueColor];
    
    self.reviewsVC = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    self.reviewsVC.backgroundColor = [UIColor grayColor];
    
    self.contactVC = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    self.contactVC.backgroundColor = [UIColor greenColor];
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    NSArray *viewArray = [NSArray arrayWithObjects:self.profileVC, self.insuranceVC, self.reviewsVC, self.contactVC, nil];
    
    for(int i=0; i<viewArray.count; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        [subview addSubview:[viewArray objectAtIndex:i]];
        [self.scrollView addSubview:subview];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * viewArray.count, self.scrollView.frame.size.height);

    
    [self profileSelected];
    
    UITapGestureRecognizer *profileGesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnProfile:)];
    [self.profileView addGestureRecognizer:profileGesRecognizer];
    
    UITapGestureRecognizer *insuranceGesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnInsurance:)];
    [self.insuranceView addGestureRecognizer:insuranceGesRecognizer];
    
    UITapGestureRecognizer *reviewGesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnReview:)];
    [self.reviewView addGestureRecognizer:reviewGesRecognizer];
    
    UITapGestureRecognizer *contactGesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnContact:)];
    [self.contactView addGestureRecognizer:contactGesRecognizer];
    
    }

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}


- (void)handleTapOnProfile:(UITapGestureRecognizer *)gestureRecognizer{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*0, 0);
    [self profileSelected];
}

- (void)handleTapOnInsurance:(UITapGestureRecognizer *)gestureRecognizer{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*1, 0);
    [self insuranceSelected];
}

- (void)handleTapOnReview:(UITapGestureRecognizer *)gestureRecognizer{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*2, 0);
    [self reviewsSelected];
}

- (void)handleTapOnContact:(UITapGestureRecognizer *)gestureRecognizer{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*3, 0);
    [self contactSelected];
}

-(void)profileSelected{
    self.profileLabelText.textColor = [UIColor blackColor];
    self.profileUnderlineView.hidden = NO;
    self.insuranceUnderlineView.hidden = YES;
    self.reviewUnderlineView.hidden = YES;
    self.contactUnderlineView.hidden = YES;
    self.insuranceLabelText.textColor = [UIColor lightGrayColor];
    self.reviewLabelText.textColor = [UIColor lightGrayColor];
    self.contactLabelText.textColor = [UIColor lightGrayColor];
}

-(void)insuranceSelected{
    self.insuranceLabelText.textColor = [UIColor blackColor];
    self.insuranceUnderlineView.hidden = NO;
    self.profileUnderlineView.hidden = YES;
    self.reviewUnderlineView.hidden = YES;
    self.contactUnderlineView.hidden = YES;
    self.profileLabelText.textColor = [UIColor lightGrayColor];
    self.reviewLabelText.textColor = [UIColor lightGrayColor];
    self.contactLabelText.textColor = [UIColor lightGrayColor];
}

-(void)reviewsSelected{
    self.reviewLabelText.textColor = [UIColor blackColor];
    self.reviewUnderlineView.hidden = NO;
    self.profileUnderlineView.hidden = YES;
    self.insuranceUnderlineView.hidden = YES;
    self.contactUnderlineView.hidden = YES;
    self.profileLabelText.textColor = [UIColor lightGrayColor];
    self.insuranceLabelText.textColor = [UIColor lightGrayColor];
    self.contactLabelText.textColor = [UIColor lightGrayColor];
}

-(void)contactSelected{
    self.contactLabelText.textColor = [UIColor blackColor];
    self.contactUnderlineView.hidden = NO;
    self.profileUnderlineView.hidden = YES;
    self.insuranceUnderlineView.hidden = YES;
    self.reviewUnderlineView.hidden = YES;
    self.profileLabelText.textColor = [UIColor lightGrayColor];
    self.insuranceLabelText.textColor = [UIColor lightGrayColor];
    self.reviewLabelText.textColor = [UIColor lightGrayColor];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    static NSInteger previousPage = 0;
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    
    if (page == 0) {
        [self profileSelected];
    }
    if (page == 1) {
        [self insuranceSelected];
    }
    if (page == 2) {
        [self reviewsSelected];
    }
    if (page == 3) {
        [self contactSelected];
    }
    
    if (previousPage != page) {
        
        NSLog(@"Page#:%ld", (long)page);
        
        previousPage = page;
    }
}

@end
