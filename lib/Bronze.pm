package Bronze;
# ABSTRACT: Model-oriented Content Management System
use Moose;
use KiokuDB;
use KiokuDB::Backend::DBI;
use Bronze::GIN;
use Bronze::Model;
use MooseX::Method::Signatures;
use MooseX::Types::Moose qw(HashRef);
use Module::Load;

=head1 ATTRIBUTES

=over

=item backend_class

The class that should be used when initializing the backend. Note that
the backend should support Set GIN queries.

=cut

has backend_class =>
  ( is => 'ro',
    isa => 'Str',
    required => 1 );

=item backend_args

This is the connect_info attribute that is passed to the backend. It
must be a hashref. You don't need to provide the "extract" argument
because Bronze will build it.

=cut

has backend_args =>
  ( is => 'ro',
    isa => HashRef,
    required => 1);

=item schema

This contains the KiokuDB handle, it is initialized by this class.

=cut

has schema =>
  ( is => 'ro',
    lazy => 1,
    builder => '_build_schema' );

sub _build_schema {
    my $self = shift;
    load $self->backend_class;
    return KiokuDB->new
      ( backend => $self->backend_class->new
        ( %{$self->backend_args},
          extract => Bronze::GIN->new() ) );
}

=method model($user)

This method is called to instantiate a Bronze::Model in the context of
a given user.

=cut

method model($user?) {
    Bronze::Model->new( schema => $self->schema,
                        user => $user );
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 LIMITATIONS

This module was supposed to be backend agnostic, but in this version
we still are coupled to KiokuDB::Backend::DBI.

=cut
