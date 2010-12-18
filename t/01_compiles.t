use strict;
use warnings;
use Test::More;
use Test::Exception;
use File::Find;
use Module::Load;

BEGIN { use_ok( 'Bronze' ); }
BEGIN { use_ok( 'Bronze::Model' ); }
BEGIN { use_ok( 'Bronze::GIN' ); }
BEGIN { use_ok( 'Bronze::Types::Post' ); }

use constant TESTDB => 'dbi:SQLite:t/01_compiles.db';

lives_ok(sub {

    my $bronze = Bronze->new
      ( backend_class => 'KiokuDB::Backend::DBI',
        backend_args  =>
        { connect_info => ['dbi:SQLite:'.TESTDB] } );
    ok($bronze, 'Creates the bronze object successfully');

    my $model = $bronze->model(undef);
    ok($model, 'Obtains a model');

}, ' initializes the bronze.');

END {
    unlink TESTDB;
};

done_testing();
