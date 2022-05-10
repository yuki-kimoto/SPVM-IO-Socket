
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";

use Test::More;

use SPVM 'TestCase::IO::Socket';

# Start objects count
my $start_memory_blocks_count = SPVM::get_memory_blocks_count();

# Socket
{
  ok(SPVM::TestCase::IO::Socket->basic);
  ok(SPVM::TestCase::IO::Socket->basic_auto_close);
  ok(SPVM::TestCase::IO::Socket->fileno);
}


# All object is freed
my $end_memory_blocks_count = SPVM::get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
