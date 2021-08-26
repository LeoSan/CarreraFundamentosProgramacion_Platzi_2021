class Cash extends Payment {
    constructor(id, fecha, efectivo) {
        super(id, fecha)
        this.efectivo = efectivo;
    }
}