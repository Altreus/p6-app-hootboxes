unit package App::Hootboxes;

role DBObject is export {
    has $!dbh;
    has $.table-name;
}
