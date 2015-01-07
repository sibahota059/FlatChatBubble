//
//  SPHLeftBubbleCell.m
//  NewChatBubble
//
//  Created by Siba Prasad Hota  on 1/3/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import "SPHTextBubbleCell.h"
#import "UIImage+Utils.h"
#import "Constantvalues.h"



@implementation SPHTextBubbleCell

@synthesize timestampLabel = _timestampLabel;


// ***********************************================================================******************************//

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0f) {
            self.textLabel.backgroundColor = [UIColor whiteColor];
        }
        self.textLabel.font = [UIFont systemFontOfSize:14.0f];
        self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.textLabel.numberOfLines = 0;
        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.textLabel.textColor = [UIColor whiteColor];
        
        _timestampLabel = [[UILabel alloc] init];
        _timestampLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _timestampLabel.textAlignment = NSTextAlignmentCenter;
        _timestampLabel.backgroundColor = [UIColor clearColor];
        _timestampLabel.font = [UIFont systemFontOfSize:12.0f];
        _timestampLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
        _timestampLabel.frame = CGRectMake(0.0f, 12, self.bounds.size.width, 18);
        
        [self.contentView addSubview:_timestampLabel];
        
        messageBackgroundView = [[UIImageView alloc] initWithFrame:self.textLabel.frame];
        [self.contentView insertSubview:messageBackgroundView belowSubview:self.textLabel];
        
        self.AvatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,10+TOP_MARGIN, 50, 50)];
       
        [self.contentView addSubview:self.AvatarImageView];
        
        CALayer * l = [self.AvatarImageView layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:self.AvatarImageView.frame.size.width/2.0];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
        UILongPressGestureRecognizer *lpgr
        = [[UILongPressGestureRecognizer alloc]
           initWithTarget:self action:@selector(tapRecognized:)];
        lpgr.minimumPressDuration = .4; //seconds
        lpgr.delegate = self;
        [self addGestureRecognizer:lpgr];
        
    }
    
    return self;
}


// ***********************************================================================******************************//
// **********************| DELEGATE FUNCTIONS OF  CELL |****************************************************************************//
// ***********************************================================================******************************//


-(void)tapRecognized:(UITapGestureRecognizer *)tapGR
{
    [self.CustomDelegate textCellDidTapped:self AndGesture:tapGR];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:)|| action==@selector(forward:) || action==@selector(delete:)) {
        return YES;
    }
    return NO;
}
- (IBAction)copy:(id)sender
{
    [self.CustomDelegate cellCopyPressed:self];
}

- (IBAction)forward:(id)sender
{
    [self.CustomDelegate cellForwardPressed:self];
}

- (IBAction)delete:(id)sender
{
    [self.CustomDelegate cellDeletePressed:self];
}

- (void)showMenu
{
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    [self becomeFirstResponder];
    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"Forward" action:@selector(forward:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:menuItem,nil]];
    [[UIMenuController sharedMenuController] update];
    CGRect textFrame=self.textLabel.frame; textFrame.origin.x-=50;
    [[UIMenuController sharedMenuController] setTargetRect:textFrame inView:self];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}

// ***********************************================================================******************************//
// **********************| LAYOUT CELL |****************************************************************************//
// ***********************************================================================******************************//


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize labelSize =[self.textLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width-94, MAXFLOAT)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:14.0f] }
                                                        context:nil].size;
    if ([self.bubbletype isEqualToString:@"LEFT"])
    {
        CGRect textLabelFrame = self.textLabel.frame;
        textLabelFrame.origin.x = 68;
        textLabelFrame.size.width = self.frame.size.width-94;
        textLabelFrame.size.height = labelSize.height;
        textLabelFrame.origin.y = 20.0f + TOP_MARGIN;
        self.textLabel.frame = textLabelFrame;
        messageBackgroundView.frame = CGRectMake(60, textLabelFrame.origin.y - 12, labelSize.width + 16,labelSize.height + 18);
        self.AvatarImageView.frame=CGRectMake(5,10+TOP_MARGIN, 50, 50);
      
        
        UIImage *coloredImage = [[UIImage imageNamed:@"messages_left_bubble.png"] maskWithColor:BLUE_TEXT_HIGHLIGHT_COLOR];
        messageBackgroundView.image = [[UIImage imageWithCGImage:coloredImage.CGImage] stretchableImageWithLeftCapWidth:20 topCapHeight:16];
        
    }else
    {
        // Right
        
        CGRect textLabelFrame = self.textLabel.frame;
        textLabelFrame.size.width = self.frame.size.width-94;
        self.textLabel.frame = textLabelFrame;
        
        textLabelFrame.size.height = labelSize.height + 6;
        textLabelFrame.origin.y = 20.0f + TOP_MARGIN;
        textLabelFrame.origin.x = self.bounds.size.width - labelSize.width - 70;
        self.textLabel.frame = textLabelFrame;
        
        messageBackgroundView.frame = CGRectMake(textLabelFrame.origin.x -8, textLabelFrame.origin.y - 2, labelSize.width + 16, labelSize.height + 18);
         messageBackgroundView.image = [[UIImage imageNamed:@"messages_right_bubble.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:16];
        
        self.AvatarImageView.frame=CGRectMake( self.frame.size.width-55,10+TOP_MARGIN, 50, 50);
        
    }
    
}

// ***********************************================================================******************************//

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor);
    
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 0, 21); //start at this point
    CGContextAddLineToPoint(context, (self.bounds.size.width - 120) / 2, 21); //draw to this point
    
    CGContextMoveToPoint(context, self.bounds.size.width, 21); //start at this point
    CGContextAddLineToPoint(context, self.bounds.size.width - (self.bounds.size.width - 120) / 2, 21); //draw to this point
    
    CGContextStrokePath(context);
    
}

// ***********************************================================================******************************//



@end
