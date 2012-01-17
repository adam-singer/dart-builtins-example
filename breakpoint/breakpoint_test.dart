void C() {
    print("Enter C");
    print("Exit C");
}
void B() {
    print("Enter B");
    print("Exit B");
}
void A() {
    print("enter A");
    B();
    C();
    print("exit A");
}
void main() {
    A();
}
