class User extends Account {
    
    constructor(name, document, tipo) {
        super(name, document)
        this.tipo = tipo;
    }
}