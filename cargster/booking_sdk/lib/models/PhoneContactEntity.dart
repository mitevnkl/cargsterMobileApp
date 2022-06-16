class PhoneContactEntity {
  String name;
  String phone;

  PhoneContactEntity(this.name, this.phone);

  @override
  bool operator ==(Object other) {
    return this.toString() == other.toString();
    // return this.name == other.name && this.phone == other.phone;
  }

  @override
  String toString() {
    return this.name.toString() + this.phone.toString();
  }
}
