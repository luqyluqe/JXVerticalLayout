//
//  JXVerticalLayout.m
//  JXVerticalLayout
//

#import "JXVerticalLayout.h"

@interface JXVerticalLayout ()

@property (strong,nonatomic) UIView* view;

@end

@implementation JXVerticalLayout

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super init]) {
        self.view=[[UIView alloc] initWithFrame:frame];
        self.appendHeight=frame.size.height;
    }
    return self;
}

-(void)appendView:(UIView *)view alignment:(JXVerticalLayoutAlignment)alignment
{
    CGRect frame0;
    CGSize size0=view.frame.size;
    frame0.size=size0;
    CGRect frame=self.view.frame;
    CGSize size=frame.size;
    switch (alignment) {
        case JXVerticalLayoutAlignmentLeft:
        {
            frame0.origin=CGPointMake(0, self.appendHeight);
            break;
        }
        case JXVerticalLayoutAlignmentCenter:
        {
            frame0.origin=CGPointMake((size.width-size0.width)/2, self.appendHeight);
            break;
        }
        case JXVerticalLayoutAlignmentRight:
        {
            frame0.origin=CGPointMake(size.width-size0.width, self.appendHeight);
            break;
        }
    }
    view.frame=frame0;
    frame.size=CGSizeMake(size.width, size.height+size0.height);
    self.view.frame=frame;
    [self.view addSubview:view];
    self.appendHeight=frame.size.height;
}

-(void)appendLabel:(UILabel *)label widthLimit:(CGFloat)widthLimit alignment:(JXVerticalLayoutAlignment)alignment
{
    [self appendLabel:label withoutStartingNewLineWithWidthLimit:widthLimit alignment:alignment];
    self.appendHeight=self.view.bounds.size.height;
}

-(void)appendLabel:(UILabel *)label withoutStartingNewLineWithWidthLimit:(CGFloat)widthLimit alignment:(JXVerticalLayoutAlignment)alignment
{
    label.numberOfLines=0;
    CGRect frame=self.view.frame;
    CGSize size=frame.size;
    CGSize boundingSize=[JXVerticalLayout boundingSizeForText:label.text font:label.font widthLimit:widthLimit];
    CGRect tmpLabelFrame;
    tmpLabelFrame.size=boundingSize;
    switch (alignment) {
        case JXVerticalLayoutAlignmentLeft:
        {
            tmpLabelFrame.origin=CGPointMake(0, self.appendHeight);
            break;
        }
        case JXVerticalLayoutAlignmentCenter:
        {
            tmpLabelFrame.origin=CGPointMake((size.width-boundingSize.width)/2, self.appendHeight);
            break;
        }
        case JXVerticalLayoutAlignmentRight:
        {
            tmpLabelFrame.origin=CGPointMake(size.width-boundingSize.width, self.appendHeight);
            break;
        }
    }
    label.frame=tmpLabelFrame;
    frame.size=CGSizeMake(size.width, size.height+boundingSize.height);
    self.view.frame=frame;
    [self.view addSubview:label];
}

-(void)appendBlankLineWithHeight:(CGFloat)height
{
    CGRect frame=self.view.frame;
    CGSize size=frame.size;
    UIView* blank=[[UIView alloc] initWithFrame:CGRectMake(0, self.appendHeight, size.width, height)];
    blank.backgroundColor=self.view.backgroundColor;
    frame.size=CGSizeMake(size.width, size.height+height);
    self.view.frame=frame;
    self.appendHeight=frame.size.height;
    [self.view addSubview:blank];
}

-(void)appendBlankLineWithHeight:(CGFloat)height color:(UIColor *)color
{
    CGRect frame=self.view.frame;
    CGSize size=frame.size;
    UIView* blank=[[UIView alloc] initWithFrame:CGRectMake(0, self.appendHeight, size.width, height)];
    blank.backgroundColor=color;
    frame.size=CGSizeMake(size.width, size.height+height);
    self.view.frame=frame;
    self.appendHeight=frame.size.height;
    [self.view addSubview:blank];
}

@end

@implementation JXVerticalLayout(Measurement)

+(CGSize)boundingSizeForText:(NSString *)text font:(UIFont *)font widthLimit:(CGFloat)widthLimit
{
    NSDictionary* attributes=@{NSFontAttributeName:font};
    CGRect boundingRect=[text boundingRectWithSize:CGSizeMake(widthLimit, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return boundingRect.size;
}

@end