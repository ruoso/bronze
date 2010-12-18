package BronzeTest;
use Bronze;

use constant TESTDB => 't/lib/BronzeTest.db';

# makes sure no old db is there
unlink TESTDB;
$::bronze = Bronze->new
  ( backend_class => 'KiokuDB::Backend::DBI',
    backend_args  =>
    { create => 1,
      connect_info => ['dbi:SQLite:'.TESTDB] } );

$::user = BronzeTest::User->new;

END {
    undef $::bronze;
    unlink TESTDB;
};

package BronzeTest::User;
use Moose;
sub id { 'testuser' }
sub roles { qw(role1 role2 role3) };

1;
