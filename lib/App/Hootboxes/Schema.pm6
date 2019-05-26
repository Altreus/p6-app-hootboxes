unit package App::Hootboxes::Schema;
use Red;

model Claim is rw is export {
    has Str $.student-email is referencing{ :model<Student>, :column<email> };
    has $.student is relationship({ .student-email }, :model<Student>);
    has Int $.reward-id is referencing{ :model<Reward>, :column<id> };
    has $.reward is relationship({ .reward-id }, :model<Reward>);
}

model Hootbox is rw is export {
    has Int $.id        is serial;
    has Int $.reward    is referencing{ :model<Reward>, :column<id> };
    has Int $.level     is column;
}

model Reward is rw is export {
    has Int $.id    is serial;
    has Str $.name  is column;
    has Int $.cost  is column;

    has @.claims is relationship({.reward-id }, :model<Claim>);
}

model Student is rw is export {
    has Str     $.email     is id;
    has Str     $.name      is column;
    has         @.claims    is relationship({ .student-id }, :model<Claim>);

    method rewards { @.claims.map: *.reward }
}

sub deploy is export {
    Reward.^create-table;
    Student.^create-table;
    Claim.^create-table;
    Hootbox.^create-table;
}
