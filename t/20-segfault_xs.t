use strict;
use warnings;
use threads;

use Test::More;

use B::Hooks::EndOfScope::XS;

pass( "Before thread create" );
my $thr = threads->create(\&worker);
pass( "After thread create" );
$thr->join();
pass( "After thread join" );

done_testing( 4 );

exit;

sub worker {
    pass( "In worker" );
    return 1;
}
