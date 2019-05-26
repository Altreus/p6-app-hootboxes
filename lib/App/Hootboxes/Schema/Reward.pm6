use Red;

model Reward is rw is export {
    has Int $.id    is serial;
    has Str $.name  is column;
    has Int $.cost  is column;

    has @.claims is relationship({.reward-id }, :model<Claim>);
}
