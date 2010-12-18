package Bronze::Model;
# ABSTRACT: The Model class for Bronze applications
use Moose;
use Search::GIN::Query::Manual;
use Search::GIN::Query::Set;
use MooseX::Method::Signatures;
use aliased 'MooseX::Meta::Method::Transactional';
use namespace::clean -except => 'meta';
use List::Util qw(first);

has user    => ( is => 'ro', required => 1 );
has schema  => ( is => 'ro', required => 1,
                 handles => [qw(lookup new_scope)]);

=method search

This method encapsulates the building of the Search::GIN::Query in a
simple hash. It also adds the security verification.

=cut

method search($filter is HashRef) does Transactional {

    my $permquery = Search::GIN::Query::Manual->new
      ( method => 'any',
        values =>
        { accessible =>
          [ 'any',
            'u:'.$self->user->id,
            map { 'g:'.$_ } $self->user->roles
          ]
        }
      );

    my $userquery = Search::GIN::Query::Manual->new
      ( method => 'all',
        values => $filter );

    my $finalquery = Search::GIN::Query::Set->new
      ( operation => 'EXCEPT',
        subqueries => [ $userquery, $permquery ] );

    return $self->schema->search($finalquery);

}

=method store

This method is used to store data in the backend. If the owner,
group and permissions are not set, sane defaults are set.

=cut

method store($object is Bronze::Types::Data) does Transactional {
    $object->owner || $object->owner($self->user->id);
    $object->group || $object->group( first { 1 } $self->user->roles );
    $object->permissions || $object->permissions(0x644);
    $self->schema->store($object);
}


__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 DESCRIPTION

This class implements the actual access to the data managed by
bronze. It should be understood as the actual API to the data.

=head1 SYNOPSIS

  use Bronze::Model;
  my $b = Bronze::Model->new( user => $user,
                              kiokudb => $kiokudb );
  $b->search({ text => [qw(foo bar baz)],
               type => 'Post' });

=head1 REQUISITES

This class expects the kiokudb object used here to support the keys
extracted by Bronze::GIN.

=head1 ATTRIBUTES

=over

=item user

This refers to the currently authenticated user. Bronze model will
enforce the permission model on all objects accessed. It should
support the "id" and "roles" method.

=item schema

This refers to the kiokudb instance that should be used.

=back

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
