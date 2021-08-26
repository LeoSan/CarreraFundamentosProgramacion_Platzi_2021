class Paypal extends Payment {
    constructor(id, fecha, email) {
        super(id, fecha)
        this.email = email;
    }
}