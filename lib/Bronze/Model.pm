package Bronze::Model;
use Moose;

has user    => ( is => 'ro', required => 1 );
has kiokudb => ( is => 'ro', required => 1 );

1;

__END__

=head1 NAME

Bronze::Model - The Model class for Bronze applications

=head1 DESCRIPTION

This class implements the actual access to the data managed by
bronze. It should be understood as the actual API to the data.

=head1 SYNOPSIS

  use Bronze::Model;
  my $b = Bronze::Model->new( user => $user,
                              kiokudb => $kiokudb );
  $b->search({ words => [qw(foo bar baz)],
               type  => 'Post' });

=head1 REQUISITES

This class expects the kiokudb object used here to support the keys
extracted by Bronze::GIN.

=head1 ATTRIBUTES

This class has the following attributes:

=over

=item user

This refers to the currently authenticated user. Bronze model will
enforce the permission model on all objects accessed. It should
support the "id" and "roles" method.

=item kiokudb

This refers to the kiokudb instance that should be used.

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
