unit package App::Hootboxes::Schema;
use Red;

model Claim is rw is table<claims> is export {
    has Str $!student-email is referencing{ :model<Student>, :column<email>, \
                                            :require<App::Hootboxes::Schema>};
    has $.student is relationship({ .student-email }, :model<Student>,
                                  :require<App::Hootboxes::Schema>);

    has Int $!reward-id is referencing{ :model<Reward>, :column<id>, \
                                      :require<App::Hootboxes::Schema>};
    has $.reward is relationship({ .reward-id }, :model<Reward>,
                                 :require<App::Hootboxes::Schema>);
}

model Hootbox is rw is table<hootboxes> is export {
    has Int $.id        is serial;
    has Int $!reward    is referencing{ :model<Reward>, :column<id>, \
                                        :require<App::Hootboxes::Schema>};
    has Int $.level     is column;
}

model Reward is rw is table<rewards> is export {
    has Int $.id    is serial;
    has Str $.name  is column;
    has Int $.cost  is column;

    has @.claims is relationship({.reward-id }, :model<Claim>,
                                 :require<App::Hootboxes::Schema>);
}

model Student is rw is table<students> is export {
    has Str     $.email     is id;
    has Str     $.name      is column;
    has         @.claims    is relationship({ .student-id }, :model<Claim>,
                                            :require<App::Hootboxes::Schema>);

    method rewards { @.claims.map: *.reward }
}

sub deploy is export {
    Reward.^create-table;
    Student.^create-table;
    Claim.^create-table;
    Hootbox.^create-table;
}
