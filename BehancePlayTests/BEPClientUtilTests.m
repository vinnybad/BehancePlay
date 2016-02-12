#import "BEPClient.h"

@interface BEPClient ()
- (NSString *)searchUsersPathForQuery:(NSString *)query;
- (void)setUrlPrefix:(NSString *)urlPrefix;
@end

SpecBegin(BEPClientUtilTests)

describe(@"BEPClient", ^{
    
    context(@"searchUsersPathForQuery:", ^{
        
        it(@"should handle spaces properly", ^{
            NSString *query = @"first second";
            
            BEPClient *client = [BEPClient new];
            [client setUrlPrefix:@"URL_PREFIX"];
            NSString *result = [client searchUsersPathForQuery:query];
            
            expect(result).to.equal(@"URL_PREFIX&q=first%20second");
        });
        
    });
    
});

SpecEnd
