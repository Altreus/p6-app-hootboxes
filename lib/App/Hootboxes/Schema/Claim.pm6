use Red;

model Claim is rw is export {
    has Int $.student-id is referencing{ :model<Student>, :column<id> };
    has $.student is relationship({ .student-id }, :model<Student>);
    has Int $.reward-id is referencing{ :model<Reward>, :column<id> };
    has $.reward is relationship({ .reward-id }, :model<Reward>);
}
