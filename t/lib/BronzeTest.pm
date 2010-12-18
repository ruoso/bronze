package BronzeTest;
use Bronze;

use constant TESTDB => 't/lib/BronzeTest.db';

# makes sure no old db is there
unlink TESTDB;
$::bronze = Bronze->new
  ( backend_class => 'KiokuDB::Backend::DBI',
    backend_args  =>
    { connect_info => ['dbi:SQLite:'.TESTDB] } );

END {
    unlink TESTDB;
};


