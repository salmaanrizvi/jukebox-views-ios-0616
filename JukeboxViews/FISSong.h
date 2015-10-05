//  FISSong.h

#import <Foundation/Foundation.h>

@interface FISSong : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *album;
@property (strong, nonatomic) NSString *fileName;

-(instancetype)initWithTitle:(NSString *)title
                      artist:(NSString *)artist
                       album:(NSString *)album
                    fileName:(NSString *)fileName;

@end
