package Bronze::Controller::Editing;
use MooseX::MethodAttributes::Role;
use namespace::autoclean;

requires 'bronze_model';

sub search :Chained('base') :PathPart('') :Args(0) {
}

sub context :Chained('base') :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $self->bronze_model->
}

sub edit :Chained('context') :PathPart('') :Args(0) {
}

sub delete :Chained('bronze_object') :PathPrat('delete') :Args(0) {
}

1;
