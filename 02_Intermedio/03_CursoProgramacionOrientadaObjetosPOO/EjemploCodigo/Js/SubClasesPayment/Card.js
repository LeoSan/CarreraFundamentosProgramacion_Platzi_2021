class Card extends Payment {
    constructor(id, fecha, numberCard, dateVen, cvv) {
        super(id, fecha)
        this.numberCard = numberCard;
        this.dateVen = dateVen;
        this.cvv = cvv;
    }
}