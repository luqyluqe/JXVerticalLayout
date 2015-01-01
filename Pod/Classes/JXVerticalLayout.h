//
//  JRTXLinearLayout.h
//  JRTXLinearLayout
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JXVerticalLayoutAlignment) {
    JXVerticalLayoutAlignmentLeft,
    JXVerticalLayoutAlignmentCenter,
    JXVerticalLayoutAlignmentRight
};

@interface JXVerticalLayout : NSObject

@property (strong,readonly,nonatomic) UIView* view;
@property (assign,nonatomic) CGFloat appendHeight;

-(instancetype)initWithFrame:(CGRect)frame;
-(void)appendView:(UIView*)view alignment:(JXVerticalLayoutAlignment)alignment;
-(void)appendLabel:(UILabel*)label widthLimit:(CGFloat)widthLimit alignment:(JXVerticalLayoutAlignment)alignment;
-(void)appendLabel:(UILabel*)label withoutStartingNewLineWithWidthLimit:(CGFloat)widthLimit alignment:(JXVerticalLayoutAlignment)alignment;
-(void)appendBlankLineWithHeight:(CGFloat)height;
-(void)appendBlankLineWithHeight:(CGFloat)height color:(UIColor*)color;

@end

@interface JXVerticalLayout (Measurement)

+(CGSize)boundingSizeForText:(NSString*)text font:(UIFont*)font widthLimit:(CGFloat)widthLimit;

@end