use Red;

model Student is rw is export {
    has Str     $.email     is id;
    has Str     $.name      is column;
    has         @.claims    is relationship({ .student-id }, :model<Claim>);

    method rewards { @.claims.map: *.reward }
}
